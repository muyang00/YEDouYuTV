//
//  AmuseHeadView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/1.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

let kAmuseViewID = "kAmuseViewID"
class AmuseHeadView: UIView {

    var groups : [AnchorGroup]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       autoresizingMask = UIViewAutoresizing()
        collectionView.register(UINib(nibName: "CollectionAmuseHeadCell", bundle: nil), forCellWithReuseIdentifier: kAmuseViewID)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
    
}

extension AmuseHeadView {
    class func amuseHeadView () -> AmuseHeadView{
        return Bundle.main.loadNibNamed("AmuseHeadView", owner: nil, options: nil)?.first as! AmuseHeadView
    }
}

extension AmuseHeadView : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt")
    }
}

extension AmuseHeadView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAmuseViewID, for: indexPath) as! CollectionAmuseHeadCell
        
        return cell
    }
}
