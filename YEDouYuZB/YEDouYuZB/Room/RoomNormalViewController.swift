//
//  RoomNormalViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/5.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class RoomNormalViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        view.backgroundColor = UIColor.orange
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
