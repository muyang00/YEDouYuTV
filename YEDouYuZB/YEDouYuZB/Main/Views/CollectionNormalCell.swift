//
//  CollectionNormalCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
 
    @IBOutlet weak var roomNameLabel: UILabel!

    override var anchor: AnchorModel? {
        didSet{
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
        }
    }
}
