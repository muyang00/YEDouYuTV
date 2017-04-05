//
//  CollectionAmuseHeadCell.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/1.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

let kAmuseCellID = "kAmuseCellID"
class CollectionAmuseHeadCell: UICollectionViewCell {
    
   @IBOutlet weak var collectionView: UICollectionView!
    
    var groups : [AnchorGroup]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kAmuseCellID)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemW = collectionView.bounds.width / 4
        let itemH = collectionView.bounds.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
    }
}

extension CollectionAmuseHeadCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAmuseCellID, for: indexPath) as! CollectionGameCell
        //cell.backgroundColor = UIColor.randomColor()
        
        cell.baseGame = self.groups![indexPath.item]
        cell.clipsToBounds = true
        
        return cell
    }
}
extension CollectionAmuseHeadCell : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CollectionAmuseHeadCell")
    }
}
