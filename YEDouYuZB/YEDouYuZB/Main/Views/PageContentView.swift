//
//  PageContentView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

protocol PageContentViewDelegate : class {
    func pageContentView (_ contentView : PageContentView, progress : CGFloat, sourceIndex : Int, targetIndex : Int)
}

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    //MARK:- 定义属性
    fileprivate var childVcs : [UIViewController] = []
    fileprivate weak var parentViewController : UIViewController?
    fileprivate var startOffsetX : CGFloat = 0
    
    //MARK:- 懒加载属性
    fileprivate lazy var collectionView : UICollectionView = { [weak self] in
        //1. 创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        //2. 创建UICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollsToTop = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, childVcs : [UIViewController], parentViewController: UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        
        //设置UI
        setupUI()
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置UI界面
extension PageContentView {
    fileprivate func setupUI() {
        //1.将所有的子控制器添加到父控制器中
        for childVcs in childVcs {
            parentViewController?.addChildViewController(childVcs)
        }
        //2.添加UICollectionView, 用于在Cell中存放控制器的View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK:- 遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1. 创建cell
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        //2.给Cell设置内容
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let childVc = childVcs[(indexPath as IndexPath).item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
    

}
// MARK:- 遵守UICollectionViewDelegate
extension PageContentView : UICollectionViewDelegate {
    
}




