//
//  RecommendViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit


let kCycleViewH : CGFloat = 180


let kItemMargin : CGFloat = 10
let kNormalItemW = (kScreenW - 3 * kItemMargin)/2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3
let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kPrettyCellID = "kPrettyCellID"

class RecommendViewController: UIViewController {
    
    var baseVM: BaseViewModel!
    
  //MARK: - 懒加载属性
    fileprivate let recommendVM : RecommendViewModel = RecommendViewModel()
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame  = CGRect(x: 0, y: -kCycleViewH, width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    
    lazy var collectionView : UICollectionView = {[unowned self] in
        //1.
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 2, left: kItemMargin, bottom: 2, right: kItemMargin)
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        //2
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
       collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        collectionView.backgroundColor = UIColor.white
         return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupUI()
        loadData()
    }
    
}


//MARK: - 设置UI界面内容
extension RecommendViewController {
    func setupUI(){
        
        view.addSubview(collectionView)
        
        collectionView.addSubview(cycleView)
        
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH, left: 0, bottom: 0, right: 0)
        
    }
}

//MARK: - 请求数据源
extension RecommendViewController{
    func loadData(){
       
        baseVM = recommendVM
        
        recommendVM.requestData {
            
            self.collectionView.reloadData()
            
        }
        
    }
}


extension RecommendViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        if baseVM != nil {
            headerView.group = baseVM.anchorGroups[indexPath.section]
        }
      
        return headerView
    }
    
}

extension RecommendViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
    
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }else{
             return CGSize(width: kNormalItemW, height: kNormalItemH)
        }
    }
    
}

