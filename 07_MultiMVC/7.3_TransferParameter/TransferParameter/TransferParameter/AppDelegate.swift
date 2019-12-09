//
//  AppDelegate.swift
//  TransferParameter
//
//  Created by liwei on 2019/12/4.
//  Copyright © 2019 LiWei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let vc1 = VCFirst()
        
        let nav = UINavigationController(rootViewController: vc1)
        
        window?.rootViewController = nav
        
        return true
    }
}

