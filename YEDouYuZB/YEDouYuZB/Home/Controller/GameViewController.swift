//
//  GameViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH = kItemW * 6 / 5
private let kGameHeadViewH : CGFloat = 90


private let kGameCellID = "kGameCellID"
private let kHeaderViewID = "kHeaderViewID"

class GameViewController: BaseViewController {

    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kGameHeadViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()
    
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommedGameView()
        gameView.frame = CGRect(x: 0, y: -kGameHeadViewH, width: kScreenW, height: kGameHeadViewH)
        
        return gameView
    }()
    fileprivate lazy var topHeaderView : CollectionHeaderView = {
        let topHeaderView = CollectionHeaderView.collectionHeaderView()
        topHeaderView.frame = CGRect(x: 0, y: -(kGameHeadViewH + kHeaderViewH), width: kScreenW, height: kHeaderViewH)
        topHeaderView.headIconImageView.image = UIImage(named: "Img_orange")
        topHeaderView.headNameLabel.text = "常用"
        topHeaderView.headMoreBtn.isHidden = true
        return topHeaderView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }
}


//MARK: - 设置UI界面内容
extension GameViewController {
    override func setupUI(){
        contentView = collectionView
        collectionView.contentInset = UIEdgeInsets(top: kGameHeadViewH + kHeaderViewH, left: 0, bottom: 0, right: 0)
        
        view.addSubview(collectionView)
        collectionView.addSubview(topHeaderView)
        collectionView.addSubview(gameView)
       
        super.setupUI()
    }
}
//MARK: - 设置请求数据
extension GameViewController {
    func loadData(){
        gameVM.loadAllGameData {
            self.collectionView.reloadData()
            
            self.gameView.groups = Array(self.gameVM.games[0..<10])
            self.loadDataFinished()
        }
    }
}

extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameVM.games.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        cell.baseGame = self.gameVM.games[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 1.取出HeaderView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        // 2.给HeaderView设置属性
        headerView.headNameLabel.text = "全部"
        headerView.headIconImageView.image = UIImage(named: "Img_orange")
        headerView.headMoreBtn.isHidden = true
        
          return headerView
    }
    
}
