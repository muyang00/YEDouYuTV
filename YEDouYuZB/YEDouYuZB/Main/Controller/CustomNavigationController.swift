//
//  CustomNavigationController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/15.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.
        guard let systemGes = interactivePopGestureRecognizer else { return }
        
        //2.
        guard let gesView = systemGes.view else {return}
        
        //3.获取target/action
//        var count : UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            print(String(cString: name!))
//        }
        
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        
        //3.2 取出target
        guard let target = targetObjc.value(forKey: "target") else {
            return
        }
        //3.3取出Action
        let action = Selector(("handleNavigationTransition:"))
        //4.
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
        
  }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
