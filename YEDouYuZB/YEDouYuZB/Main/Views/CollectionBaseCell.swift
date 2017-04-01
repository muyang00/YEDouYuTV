//
//  CollectionBaseCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!
    
    var anchor: AnchorModel? {
        didSet{
            guard let anchor  = anchor else { return }
            
            var onlineStr : String = ""
            if anchor.online >= 10000 {
              onlineStr = "\(Int(anchor.online / 10000))万在线"
            }else{
                onlineStr = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: UIControlState())
            nickNameLabel.text = anchor.nick_name
            guard let URLStr  = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: URLStr)
        }
    }
    
    
}
