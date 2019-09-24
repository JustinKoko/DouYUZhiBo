//
//  HomeViewController.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/2/14.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var pageTitleView :PageTitleView = {
        let frame = CGRect.init(x: 0, y: kStatusBarH + kNavigationBar, width: kScreenW, height: 40)
        let titles = ["推荐", "娱乐", "趣玩", "游戏"]
        let titleView = PageTitleView.init(frame: frame, titles: titles)
//        titleView.backgroundColor = UIColor.green
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

}

// 设置 UI 界面
extension HomeViewController {
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        setupNavigationBar()
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar() {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "homeLogoIcon"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
        let size = CGSize.init(width: 40, height: 40)
        let searchItem = UIBarButtonItem(imageName: "home_newSeacrhcon", highImageName: "home_newSeacrhcon", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "home_newSaoicon", highImageName: "home_newSaoicon", size: size)
        navigationItem.rightBarButtonItems = [searchItem, qrcodeItem]
        
    }
}
