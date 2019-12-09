//
//  AppDelegate.swift
//  NavigationController
//
//  Created by liwei on 2019/12/4.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)  // 创建窗口，对于iPhone，每个应用有一个窗口
        window?.makeKeyAndVisible()     // 窗口可见
        
        let navigation = UINavigationController()
        window?.rootViewController = navigation
        
        let vc1 = VCFirst()
        navigation.pushViewController(vc1, animated: true)
        
        return true
    }
}

