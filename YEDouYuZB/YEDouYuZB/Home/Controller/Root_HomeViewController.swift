//
//  Root_HomeViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/9.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class Root_HomeViewController: UIViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "手游", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()
    
    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        //1. 确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        //2. 添加所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置界面
        setupUI()
    }

}

// MARK:- 设置UI界面
extension Root_HomeViewController{

    fileprivate func setupUI(){
        
        //0. 不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1. 设置导航栏
        setNavigationBar()
        
        //2. 添加pageTitleView
        view.addSubview(pageTitleView)
        
        //3. 添加pageContentView
        view.addSubview(pageContentView)
        
    }
    
    fileprivate func setNavigationBar(){
        
        //1. 设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo", highImageName: "", size: CGSize.zero)
        
        //2. 设置右侧的item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcoderItem = UIBarButtonItem(imageName: "image_scan", highImageName: "image_scan_click", size: size)
        // let qrcoderItem = UIBarButtonItem.creatItem(imageName: "image_scan", highImageName: "image_scan_click", size: size)
    
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcoderItem]
        
    }
    
}
