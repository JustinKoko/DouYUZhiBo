//
//  MainViewController.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/1/5.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
        
    }
   
    private func addChildVC (storyName:String) {
        let childVC = UIStoryboard.init(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChild(childVC)
    }

    private func setUpNavigationBar() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .orange
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]

    }
}
