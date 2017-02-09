//
//  Root_HomeViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/9.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class Root_HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置界面
        setupUI()
    }

}

// MARK:- 设置UI界面
extension Root_HomeViewController{

    fileprivate func setupUI(){
        
        // 1. 设置导航栏
        setNavigationBar()
        
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
