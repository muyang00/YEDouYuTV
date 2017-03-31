//
//  CollectionCycleCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/31.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionCycleCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cycleModel : CycleModel? {
        didSet{
            titleLabel.text = cycleModel?.title
            let loadURL = URL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: loadURL, placeholder: UIImage(named: "Img_default"))
        }
    }

}
