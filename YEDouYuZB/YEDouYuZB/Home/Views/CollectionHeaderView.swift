//
//  CollectionHeaderView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/16.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var headIconImageView: UIImageView!
    @IBOutlet weak var headNameLabel: UILabel!
    @IBOutlet weak var headMoreBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var group : AnchorGroup? {
        didSet{
            headNameLabel.text = group?.tag_name
            headIconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
}

//MARK: - 从xib快速创建类方法
extension CollectionHeaderView{
    class func collectionHeaderView() -> CollectionHeaderView{
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
    }
}
