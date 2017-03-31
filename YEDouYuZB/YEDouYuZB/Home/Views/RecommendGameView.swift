//
//  RecommendGameView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/3/31.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

let kGameCellID = "kGameCellID"

class RecommendGameView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIViewAutoresizing()
        collectionView.backgroundColor = UIColor.orange
       
        collectionView.register( UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }


}

extension RecommendGameView{
    class func recommedGameView () -> RecommendGameView{
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath)
        return cell
    }
}



