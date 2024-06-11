//
//  MainTabBarController.swift
//  GameExchange
//
//  Created by Abdulrahman Essa on 15/10/2021.
//

import UIKit
import Games

class BarqTabBar : UITabBarController
{
    var games : UINavigationController!
    var test : UINavigationController!
    
    override func loadView() {
        super.loadView();

    }

    override func viewDidLoad() {
        super.viewDidLoad();
        
        tabBar.barStyle = colors.tabBarStyle;
        tabBar.tintColor = colors.tabBarTintColor;
        tabBar.barTintColor = colors.tabBarBackgroundTint;
        tabBar.unselectedItemTintColor = colors.tabBarUnselectedItemTint;
        tabBar.isTranslucent = false;
        
        games = UINavigationController.init(rootViewController: GameListViewController.list(page: 1, itemLimit: 0))
        test = UINavigationController.init(rootViewController: GameListViewController.grid(page: 1, itemLimit: 0))
        
        viewControllers = [games,test]

        games.tabBarItem = UITabBarItem(title: "Games", image: nil, tag: 0)
        test.tabBarItem = UITabBarItem(title: "Games 2", image: nil, tag: 1)
        
    }
}
