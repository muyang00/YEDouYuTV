//
//  Root_LiveViewController.swift
//  YEDouYuZB
//
//  Created by yongen on 2017/5/24.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

private let kLiveListCell = "kLiveListCell"

class Root_LiveViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var liveVM : LiveViewModel = LiveViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLiveListData()
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
    func setupLiveListData() {
        
        liveVM.loadData {
          
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
