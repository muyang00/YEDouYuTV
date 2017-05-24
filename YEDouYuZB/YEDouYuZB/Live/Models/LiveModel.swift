//
//  LiveModel.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class LiveModel: NSObject {

    /// 直播视频流
    var stream_addr : String?
    /* 关注人 */
    var online_users : Int = 0
    /* 城市 */
    var city : String?
    /* 主播 */
    var creator : [String : Any]? {
        didSet {
            guard let creator = creator else { return }
            userInfo = UserModel(Dict: creator)
        }
    }
    
    // 主播信息
    var userInfo : UserModel?
    
    
    // 自定义构造函数
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class UserModel : NSObject {
    
    /// 主播名
    var nick:String?
    
    /// 主播头像
    var portrait:String?
    
    init(Dict: [String : Any]) {
        super.init()
        setValuesForKeys(Dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
}

