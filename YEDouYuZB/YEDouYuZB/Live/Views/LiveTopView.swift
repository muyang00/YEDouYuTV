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

    @IBOutlet weak var topCollectionView: UICollectionView!

    
    @IBAction func backClickAction(_ sender: UIButton) {
    
    }
    
    
    
    
}

extension LiveTopView {
    class func topView() -> LiveTopView {
        return Bundle.main.loadNibNamed("LiveTopView", owner: self, options: nil)?.first as! LiveTopView
    }
}
