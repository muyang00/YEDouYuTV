//
//  LiveTopView.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class LiveTopView: UIView {

    @IBOutlet weak var topIcon: UIImageView!

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topCollectionView: UICollectionView!

    var anchors : LiveModel? {
        didSet {
            guard let anchors = anchors else {
                return
            }
            var imageUrl = anchors.userInfo?.portrait
            // 处理图片地址
            if imageUrl?.hasPrefix("http://img2.inke.cn/") == false {
                imageUrl = "http://img2.inke.cn/" + (anchors.userInfo?.portrait)!
            }
            
            if let url = URL(string: imageUrl ?? "") {
                topIcon.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
            }else {
                topIcon.image = UIImage(named: "avatar_default")
            }
        }
    }
    

    
    
    
}

extension LiveTopView {
    class func topView() -> LiveTopView {
        return Bundle.main.loadNibNamed("LiveTopView", owner: self, options: nil)?.first as! LiveTopView
    }
}
