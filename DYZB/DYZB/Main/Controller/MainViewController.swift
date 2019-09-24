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
        
        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
        
    }
   
    private func addChildVC (storyName:String) {
        let childVC = UIStoryboard.init(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChild(childVC)
    }

}
