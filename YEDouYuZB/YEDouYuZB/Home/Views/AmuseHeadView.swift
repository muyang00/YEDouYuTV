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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let pageNum = offsetX / scrollView.bounds.width
        pageControl.currentPage = Int(pageNum)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("AmuseHeadView -----AmuseHeadView")
    }
}

extension AmuseHeadView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if groups?.count == nil { return 0 }
        let  pageNum = (groups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        return pageNum
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAmuseViewID, for: indexPath) as! CollectionAmuseHeadCell
        
          setupCellDataWithCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func setupCellDataWithCell(cell : CollectionAmuseHeadCell, indexPath : IndexPath){
      // 0页 : 0 ~ 7
      // 1页 : 8 ~ 15
      // 2页 : 16 ~ 23
     let startIndex = indexPath.item * 8
     var endIndex = (indexPath.item + 1) * 8 - 1
     
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        
      cell.groups = Array(groups![startIndex...endIndex])
        
    }
    
}
