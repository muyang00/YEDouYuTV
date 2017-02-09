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
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage(named:"logo"), for: .normal)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        //2. 设置右侧的item
        let history = UIButton()
        history.sizeToFit()
        history.setImage(UIImage(named:"image_my_history"), for: .normal)
        history.setImage(UIImage(named:"Image_my_history_click"), for: .highlighted)
        let historyItem = UIBarButtonItem(customView: history)
       
        let search = UIButton()
        search.sizeToFit()
        search.setImage(UIImage(named:"btn_search"), for: .normal)
        search.setImage(UIImage(named:"btn_search_clicked"), for: .highlighted)
        let searchItem = UIBarButtonItem(customView: search)
        
        let qrcoder = UIButton()
        qrcoder.sizeToFit()
        qrcoder.setImage(UIImage(named:"Image_scan"), for: .normal)
        qrcoder.setImage(UIImage(named:"Image_scan_click"), for: .highlighted)
        let qrcoderItem = UIBarButtonItem(customView: qrcoder)
    
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcoderItem]
        
    }
    
}
