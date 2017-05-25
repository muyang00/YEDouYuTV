//
//  Root_LiveViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit
import MJRefresh

private let kLiveListCell = "kLiveListCell"

class Root_LiveViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var liveVM : LiveViewModel = LiveViewModel()
  
    static var isDirectionUp : Bool = false
    fileprivate var lastOffsetY : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        refreshData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Root_LiveViewController.isDirectionUp = false
    }
}

//MARK:- UI页面设置
extension Root_LiveViewController {
   override func setupUI() {
    
        //0.
         contentView = tableView
    
        //1.不要调整内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //2.tableview的代理设置
        tableView.backgroundColor = UIColor.orange
        tableView.rowHeight = 466
        tableView.register(UINib(nibName: "LiveListViewCell", bundle: nil), forCellReuseIdentifier: kLiveListCell)
        view.addSubview(tableView)
    
       super.setupUI()
    
    }
}

//MARK:- 数据请求处理
extension Root_LiveViewController {
    
    func refreshData() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(setupLiveListData))
        tableView.mj_header.beginRefreshing()
    }
    
    func setupLiveListData() {
        
        liveVM.loadData {
          
            self.tableView.mj_header.endRefreshing()
            
            self.tableView.reloadData()
            
            self.loadDataFinished()
        }
    
        
    }
}

extension Root_LiveViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("indexPath ----- \(indexPath)")
        let liveDetailVC = Live_DetailViewController()
        liveDetailVC.anchorModel = liveVM.anchors[indexPath.row]
        present(liveDetailVC, animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.removeAllAnimations()
        cell.layer.transform = CATransform3DMakeScale(0.3, 0.3, 1)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }, completion: { (_) in
            let anim = CATransition()
            anim.type = "rippleEffect"
            anim.duration = 1
            cell.layer.add(anim, forKey: "11")
        })
    }
    
}

extension Root_LiveViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveVM.anchors.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kLiveListCell, for: indexPath) as! LiveListViewCell
        cell.selectionStyle = .none
        
        cell.anchorModel = liveVM.anchors[indexPath.row]
       
        return cell
    }
}

extension Root_LiveViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetY = scrollView.contentOffset.y
        Root_LiveViewController.isDirectionUp = (lastOffsetY - currentOffsetY) < 0 ? true : false
        lastOffsetY = currentOffsetY
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > 0 {
            Root_LiveViewController.isDirectionUp = true
        }else if velocity.y < 0 {
            Root_LiveViewController.isDirectionUp = false
        }
        beginAnim()
    }
    
    fileprivate func beginAnim() {
        if Root_LiveViewController.isDirectionUp {
            hiddenTopViewAnim()
        }else {
            showTopViewAnim()
        }
    }
    
    fileprivate func hiddenTopViewAnim() {
        UIView.animate(withDuration: 2.5, animations: {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }, completion: { (_) in
            self.tableView.mj_header.isHidden = true
            self.tabBarController?.tabBar.isHidden = false
         
        })
     
    }
    
    fileprivate func showTopViewAnim() {
        UIView.animate(withDuration: 2.5, animations: {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }, completion: { (_) in
            self.tabBarController?.tabBar.isHidden = true
            self.tableView.frame = CGRect(x: 0, y: 64, width: kScreenW, height: kScreenH - 64)
            self.tableView.mj_header.isHidden = false
        })
    }
}


