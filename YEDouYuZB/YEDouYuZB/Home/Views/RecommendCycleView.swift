//
//  RecommendCycleView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/31.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class RecommendCycleView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        
    }
    
    
}
//MARK: - 从xib快速创建类方法
extension RecommendCycleView{
    class func recommendCycleView () -> RecommendCycleView{
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: nil, options: nil)?.first as! RecommendCycleView
    }
}

//MARK: - 设置UI界面的内容
extension RecommendCycleView{
    
}

//MARK: - 设置数据

extension RecommendCycleView{
    
}
