//
//  BaseViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/15.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK:- 定义属性
    var contentView : UIView?
    //MARK:- 懒加载属性
    fileprivate lazy var animImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

extension BaseViewController {
    func setupUI() {
        
        //1.
        contentView?.isHidden = true
        animImageView.isUserInteractionEnabled = false
        //2. 添加执行动画的UIImageView
        view.addSubview(animImageView)
        
        //3. 
        animImageView.startAnimating()
        
        //4. 
        view.backgroundColor = UIColor (r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        //1.
        animImageView.stopAnimating()
        //2. 
        animImageView.isHidden = true
        //3.
        contentView?.isHidden = false
        
    }
}

