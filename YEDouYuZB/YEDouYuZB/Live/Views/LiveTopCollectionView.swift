//
//  LiveTopCollectionView.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/25.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let KCellIdentifier = "KCellIdentifier"

class LiveTopCollectionView: UICollectionView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let itemW : CGFloat = self.bounds.size.height
        layout.itemSize = CGSize(width: itemW, height: itemW)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }

}
extension LiveTopCollectionView {
    fileprivate func setupUI() {
        dataSource = self
        delegate = self

        register(UINib(nibName: "LiveTopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: KCellIdentifier)
    }
}

extension LiveTopCollectionView : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCellIdentifier, for: indexPath) as! LiveTopCollectionViewCell
        return cell
    }
}
