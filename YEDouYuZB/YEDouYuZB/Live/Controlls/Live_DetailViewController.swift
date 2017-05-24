//
//  Live_DetailViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
//import IJKMediaFramework

class Live_DetailViewController: UIViewController {

    var anchorModel : LiveModel!
    
    fileprivate lazy var topView : LiveTopView = LiveTopView.topView()
   // var ijkplayer : IJKFFMoviePlayerController!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
        self.topView.isHidden = true
        
//        NotificationCenter.default.addObserver(self, selector: #selector(playbackStateDidChange(noti:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: nil)
//        self.ijkplayer.prepareToPlay()
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
//        if self.ijkplayer != nil {
//            self.ijkplayer.pause()
//            self.ijkplayer.stop()
//            self.ijkplayer.shutdown()
//        }
    }
}

extension Live_DetailViewController {
    fileprivate func setupUI() {
        
        let requesturl = URL(string: self.anchorModel.stream_addr ?? "")
        
    
        /*1.
        let options = IJKFFOptions.byDefault()
        
    ijkplayer = IJKFFMoviePlayerController(contentURL: requesturl, with: options)
        ijkplayer.view.frame = view.bounds
        
        ijkplayer.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        ijkplayer.scalingMode = .aspectFill
        ijkplayer.shouldAutoplay = true
        
        self.view.autoresizesSubviews = true
        
        view.addSubview(ijkplayer.view)
        
        */
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}


extension Live_DetailViewController {
    func playbackStateDidChange(noti : Notification) {
     
        
    }
}

