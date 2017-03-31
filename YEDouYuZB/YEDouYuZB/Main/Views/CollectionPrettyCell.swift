//
//  CollectionPrettyCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {

    @IBOutlet weak var cityBtn: UIButton!
    
    override var anchor: AnchorModel? {
        didSet{
            super.anchor = anchor
            cityBtn.setTitle(anchor?.anchor_city, for: UIControlState())
        }
    }
}
