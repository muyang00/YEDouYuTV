//
//  BaseAnchorViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/15.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit



let kItemMargin : CGFloat = 10
let kNormalItemW = (kScreenW - 3 * kItemMargin)/2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3
let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
let kPrettyCellID = "kPrettyCellID"

class BaseAnchorViewController: UIViewController {
    
    var baseVM : BaseViewModel!
    
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

extension BaseAnchorViewController {
    
    func setupUI() {
        view.addSubview(collectionView)
    }
}

extension BaseAnchorViewController {
    func loadData() {
        
    }
}


extension BaseAnchorViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            cell.anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
       
            headerView.group = baseVM.anchorGroups[indexPath.section]
        
        return headerView
    }
    
}

extension BaseAnchorViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath", indexPath)
    }
    
}



