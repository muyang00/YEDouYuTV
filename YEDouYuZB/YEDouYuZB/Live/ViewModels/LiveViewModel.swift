//
//  LiveViewModel.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import SwiftyJSON

class LiveViewModel: NSObject {

    lazy var anchors : [LiveModel] = [LiveModel]()
}

extension LiveViewModel {
    
    func loadData(_ finishedCallBack : @escaping() -> ()) {
        NetworkTools.requestData(.get, URLString: "http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1") {
            (result) in
           let json  = JSON(result)
            let dataArray = json["lives"]
            for dict in dataArray {
                if let dict = dict.1.dictionaryObject {
                    let model = LiveModel(dict: dict)
                    self.anchors.append(model)
                }
            }
            
        finishedCallBack()
        }
    }
}
