//
//  RecommendViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

class RecommendViewController: BaseAnchorViewController {
    
    
  //MARK: - 懒加载属性
    fileprivate let recommendVM : RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kGameViewH + kCycleViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
       let gameView = RecommendGameView.recommedGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
}


//MARK: - 设置UI界面内容
extension RecommendViewController {
   override func setupUI(){
        super.setupUI()
    
        view.addSubview(collectionView)
        
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        
    }
}

//MARK: - 请求数据源
extension RecommendViewController{
   override func loadData(){
       
        baseVM = recommendVM
        
        recommendVM.requestData {
            
            self.collectionView.reloadData()
            
            var groups = self.recommendVM.anchorGroups;
            //移除两组没用的数据
            groups.removeFirst()
            groups.removeFirst()
            
            //添加更多按钮
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
            
            self.loadDataFinished()
        }
        
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        }else{
           return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }else{
             return CGSize(width: kNormalItemW, height: kNormalItemH)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let presentVC = RoomShowViewController()
        
        presentVC.anchorModel = baseVM.anchorGroups[indexPath.row]
        
        present(presentVC, animated: true, completion: nil)

        
    }
    
}

