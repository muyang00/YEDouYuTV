//
//  FunnyViewModel.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/1.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()){
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3",parameters: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallback)
    }
}
