//
//  AppDelegate.swift
//  GameExchange
//
//  Created by Abdulrahman Essa on 13/07/2021.
//

import UIKit
import Games
import HomePage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let entryVC = BarqTabBar()
    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()

        window?.rootViewController = entryVC
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

