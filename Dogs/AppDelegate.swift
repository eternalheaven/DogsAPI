//
//  AppDelegate.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        let nc = UINavigationController(rootViewController: MainViewController())
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}

