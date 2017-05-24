//
//  RoomShowViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 17/4/5.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

class RoomShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purple
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapAction))
        view.addGestureRecognizer(tap)
    }
    
    func tapAction() {
        
        dismiss(animated: true, completion: nil)
    }
    
}
