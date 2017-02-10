//
//  PageTitleView.swift
//  YEDouYuZB
//
//  Created by yongen on 17/2/10.
//  Copyright © 2017年 yongen. All rights reserved.
//

import UIKit

//MARK:- 定义常量

private let kScrollLineH : CGFloat = 2
private let kNornamlColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)


//MARK:- 定义PageTitleView类


class PageTitleView: UIView {

    
    //MARK:- 定义属性
    fileprivate var titles : [String]
    
    //MARK:- 懒加载属性
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    fileprivate lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    fileprivate lazy var scrollLine : UIView = {
       let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    //MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]){
        self.titles = titles
        super.init(frame: frame)
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageTitleView {
    
    func setupUI() {
        
        //1. 添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
       
        //2. 添加title对应的Label
        setupTitleLabels()
        
        //3. 设置底线和滚动的滑块
        setupBotttomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLabels(){
     // 0. 确定label的一些frame的值
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let laeblY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            //1. 创建UILabel
            let label = UILabel()
            //2. 设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNornamlColor.0, g: kNornamlColor.1, b: kNornamlColor.2)
            label.textAlignment = .center
            
            //3. 设置frame
            let laeblX : CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: laeblX, y: laeblY, width: labelW, height: labelH)
            //4. 将label添加到scrollView
            scrollView.addSubview(label)
            titleLabels.append(label)
            //5. 给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelsClick(_:)))
            label.addGestureRecognizer(tapGes)
        
        }
        
        
        
        
    
    }
    
    fileprivate func setupBotttomLineAndScrollLine(){
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        //2. 添加scrollLine
        //2.1 获取第一个Label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        //2.2设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

// MARK:- 监听label的点击
extension PageTitleView {
    @objc fileprivate func titleLabelsClick (_ tapGes: UITapGestureRecognizer) {
        
        print("\(tapGes)")
        
    }
}



