//
//  UIBarButtonItem+Extension.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/9.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func creatItem (imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
    }
    */
    // 遍历构造函数: 1> convenience开头 2> 在构造函数中必须明确强调用一个设计的构造函数（self）

    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero) {
        //1.创建UIBUtton
        let btn = UIButton()
        //2. 设置btn的图片
        btn.setImage(UIImage(named:imageName), for: .normal)
        if highImageName != "" {
           btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        
        //3. 设置尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        //4. 创建UIBarButtonItem
        self.init(customView : btn)
        
    }
}
