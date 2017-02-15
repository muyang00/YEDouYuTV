//
//  NSDate+Extension.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import Foundation

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
