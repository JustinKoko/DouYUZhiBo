//
//  HomeViewController.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/2/14.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

/**懒加载部分*/
    
    private lazy var pageTitleView :PageTitleView = {
        let frame = CGRect.init(x: 0, y: kStatusBarH + kNavigationBar, width: kScreenW, height: 40)
        let titles = ["推荐", "娱乐", "趣玩", "游戏", "新闻", "直播", "小视频"]
        let titleView = PageTitleView.init(frame: frame, titles: titles)
        titleView.backgroundColor = UIColor.orange
        return titleView
    }()
    
    private lazy var controllerScrollViews : UIScrollView = {
        let frame = CGRect.init(x: 0, y: pageTitleView.frame.size.height, width: kScreenW, height: kScreenH - 40)
        let VCScrollView = UIScrollView.init(frame: frame)
        VCScrollView.isPagingEnabled = true
        VCScrollView.contentSize = CGSize.init(width: 5 * kScreenW, height: frame.height)
        return VCScrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.view.addSubview(controllerScrollViews)
        setUpChildVCs(["recommendVC", "entertainmentVC", "playVC", "gameVC", "newsVC"])
        
    }
    
    private func setUpChildVCs(_ VCTitles: Array<Any>) {

        for name in VCTitles.enumerated() {
            let childVC = TitlteChildViewController.init()
            childVC.title = "\(name.element)"
            childVC.view.frame = CGRect.init(x: (CGFloat)(name.offset) * kScreenW, y: controllerScrollViews.frame.origin.y, width: kScreenW, height: controllerScrollViews.frame.height)
            childVC.view.backgroundColor = randomRGB()
            controllerScrollViews.addSubview(childVC.view)
            self.addChild(childVC)
        }


    }
    
    func randomRGB() -> UIColor {

            return UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)

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
