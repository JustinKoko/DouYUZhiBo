//
//  PageTitleView.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/2/14.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 1

class PageTitleView: UIView {

    private var titles : [String]
    
    private lazy var titleScrollView : UIScrollView = {
        let scrollView = UIScrollView.init()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isPagingEnabled = false
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    //创建构造函数
    init(frame:CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView {
    
    private func setupUI() {
        // 添加 scrollview
        self.addSubview(titleScrollView)
        titleScrollView.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: 40.5)
        // 添加 label
        setupTitlesLabels()
    }    
    
    private func setupTitlesLabels () {
        
        let labelW : CGFloat = frame.width / CGFloat(5)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index,title) in self.titles.enumerated() {
            let label = UILabel.init()
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.text = title
            label.tag = index
            label.textColor = UIColor.black
            label.textAlignment = NSTextAlignment.center
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect.init(x: labelX, y: labelY, width: labelW, height: labelH)
            titleScrollView.addSubview(label)
            titleScrollView.contentSize = CGSize.init(width: frame.width / CGFloat(5) * (CGFloat)(self.titles.count), height: labelH)
        }
    }
    
    private func setupBottomScrollViewLine () {
        let line = UIView.init()
        line.backgroundColor = UIColor.gray
        line.frame = CGRect.init(x: 0, y: frame.height - 0.5, width: frame.width, height: 0.5)
        addSubview(line)
    }
}
