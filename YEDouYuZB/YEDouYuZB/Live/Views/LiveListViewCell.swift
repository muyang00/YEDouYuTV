//
//  LiveListViewCell.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import Kingfisher

class LiveListViewCell: UITableViewCell {
    
    @IBOutlet weak var liveIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var anchorImageView: UIImageView!
    
    var anchorModel : LiveModel? {
        didSet {
            guard let anchorModel = anchorModel else { return }
            
            onlineLabel.text = "\(anchorModel.online_users)人在线"
            cityLabel.text = anchorModel.city
            nameLabel.text = anchorModel.userInfo?.nick
            var imageUrl = anchorModel.userInfo?.portrait
            if imageUrl?.hasPrefix("http://img2.inke.cn/") == false {
                imageUrl = "http://img2.inke.cn/" + (anchorModel.userInfo?.portrait)!
            }
            if let url = URL(string: imageUrl ?? "") {
                
                liveIcon.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
                anchorImageView.kf.setImage(with: url, placeholder: UIImage(named: "avatar_default"))
            } else {
                liveIcon.image = UIImage(named: "avatar_default")
                anchorImageView.image = UIImage(named: "avatar_default")
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
}
