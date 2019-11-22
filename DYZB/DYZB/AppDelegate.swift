//
//  AppDelegate.swift
//  DYZB
//
//  Created by 梁新昌 on 2018/12/31.
//  Copyright © 2018 liangxinchang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().tintColor = UIColor.orange;
        
        return true
    }

}

