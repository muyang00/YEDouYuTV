//
//  MainViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/9.
//  Copyright © 2017年 yongen. All rights reserved.
//

/*
 
 这里是不使用Refactor to Storyboard,适配ios 8 使用的方法， 现在暂不考虑适配ios8 ，所以这里的类暂不用;
 如果使用就可以和Main.Storyboard进行关联，并且删除Main.Storyboard后面的四个小框就可以
 
 */
import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        addChildVC("Home")
        addChildVC("Live")
        addChildVC("Discover")
        addChildVC("Profile")
    }
    
    fileprivate func addChildVC(_ storyName: String) {
        //1. 通过UIStoryboard获取控制器
       let childVC = UIStoryboard(name: storyName, bundle : nil).instantiateInitialViewController()!
        //2. 将childVC作为子控制器
        addChildViewController(childVC)
        
    }
}
