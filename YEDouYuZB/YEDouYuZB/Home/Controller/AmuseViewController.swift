//
//  AmuseViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kAmuseViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {

    //懒加载属性
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    fileprivate lazy var amuseView : AmuseHeadView  = {
        let amuseView = AmuseHeadView.amuseHeadView()
        amuseView.frame = CGRect(x: 0, y: -kAmuseViewH, width: kScreenW, height: kAmuseViewH)
        return amuseView
    }()
}

//MARK: -设置UI界面内容
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
       
        collectionView.addSubview(amuseView)
        collectionView.contentInset = UIEdgeInsets(top: kAmuseViewH, left: 0, bottom: 0, right: 0)
    }
}

//MARK: -设置数据源
extension AmuseViewController {
    override func loadData() {
    
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
            
            // 2.2.调整数据
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.amuseView.groups = tempGroups
             self.loadDataFinished()
        }
    }
}



