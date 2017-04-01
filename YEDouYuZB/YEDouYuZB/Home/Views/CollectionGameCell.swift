//
//  CollectionGameCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/31.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleNameLabel: UILabel!
    
    var baseGame: BaseGameModel? {
        didSet{
            titleNameLabel.text = baseGame?.tag_name
            
            if let loadURL = URL(string: baseGame?.icon_url ?? ""){
                iconImageView.kf.setImage(with: loadURL)
            }else{
                iconImageView.image = UIImage(named: "home_more_btn")
            }
        }
    }
}
