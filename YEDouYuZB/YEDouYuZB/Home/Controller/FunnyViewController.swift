//
//  FunnyViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 8

class FunnyViewController: BaseAnchorViewController {

    fileprivate lazy var funnyVM : FunnyViewModel = FunnyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension FunnyViewController {
    
    override func setupUI() {
        super.setupUI()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
        
    }
}


extension FunnyViewController {
    override func loadData() {
        baseVM = funnyVM
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
             self.loadDataFinished()
        }
    }
}
