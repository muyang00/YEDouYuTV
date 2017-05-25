//
//  Live_DetailViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import IJKMediaFramework

class Live_DetailViewController: UIViewController {

    var anchorModel : LiveModel!
    
    fileprivate lazy var topView : LiveTopView = LiveTopView.topView()
    var ijkplayer : IJKFFMoviePlayerController!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
        self.topView.isHidden = true
        YEAnimationTool.share.showAnimation(view: self.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playbackStateDidChange(noti:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: nil)
        self.ijkplayer.prepareToPlay()
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        YEAnimationTool.share.dismissAnimation({})
        YEAnimationTool.share.removeCycleTimer()
        
        if self.ijkplayer != nil {
            self.ijkplayer.pause()
            self.ijkplayer.stop()
            self.ijkplayer.shutdown()
        }
    }
}

extension Live_DetailViewController {
    fileprivate func setupUI() {
        
        let requesturl = URL(string: self.anchorModel.stream_addr ?? "")
      
        // 00 设置不报告日志
//        IJKFFMoviePlayerController.setLogReport(false)
//        IJKFFMoviePlayerController.setLogLevel(k_IJK_LOG_INFO)
    
      // 1.
        let options = IJKFFOptions.byDefault()
        
        ijkplayer = IJKFFMoviePlayerController(contentURL: requesturl, with: options)
        ijkplayer.view.frame = view.bounds
        
        ijkplayer.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        ijkplayer.scalingMode = .aspectFill
        ijkplayer.shouldAutoplay = true
        
        self.view.autoresizesSubviews = true
        
        view.addSubview(ijkplayer.view)
        ijkplayer.view.addSubview(topView)
        topView.frame = ijkplayer.view.bounds
        topView.anchors = anchorModel
        topView.backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        
        // 加载不出来时候，关闭从新加载
        YEAnimationTool.share.myBlock = { [unowned self] () -> () in
            self.backClick()
        }
        
        // 添加定时器
        YEAnimationTool.share.addCycleTimer()
        
    }
    func backClick() {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        YEAnimationTool.share.animationForHeart()
    }
    
}


extension Live_DetailViewController {
   @objc func playbackStateDidChange(noti : Notification) {
    
    switch (self.ijkplayer.playbackState) {
    case .stopped:
          print("停止")
    case .playing:
        print("正在播放")
        
        YEAnimationTool.share.dismissAnimation({
            self.ijkplayer.play()
            self.topView.isHidden = false
        })
        
    case .paused:
        print("暂停")
    case .interrupted:
          print("打断")
        
    case .seekingForward:
        print("快进")
    case .seekingBackward:
        print("快退")
        
    default:
        print("")
    }
        
    }
}

