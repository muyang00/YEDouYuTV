//
//  RoomShowViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/5.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class RoomShowViewController: UIViewController {

    var anchorModel : AnchorGroup! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple

        
        
        
        
        for roomModel in anchorModel.anchors {
        print("room_id ---- \(roomModel)")
            
        print("room_id ---- \(roomModel.room_id)")
        print("room_id ---- \(roomModel.room_name)")
        print("nick_name ---- \(roomModel.nick_name)")
        print("anchor_city ----  \(roomModel.anchor_city)")
            
        }
        
        
        
        
        
        
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapAction))
        view.addGestureRecognizer(tap)
    }
    
    func tapAction() {
        
        dismiss(animated: true, completion: nil)
    }
    
}
