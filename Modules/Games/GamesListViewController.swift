//
//  GameListViewController.swift
//  Games
//
//  Created by Abdulrahman Essa on 09/08/2021.
//

import UIKit
import SharedUI
import GameExchangeSDK


public class GamesListViewController : UIViewController
{
    var ui = GamesListView()
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        ui.entity = .demo
        hideNavbarIfFirstController()
    }
    
    public func fetchData()
    {
        Game.list(page: 1) { gameList in
            print("success")
            print(gameList.results?[1].name)
            
        } failure: { error in
            print(error)
        }

    }
}
