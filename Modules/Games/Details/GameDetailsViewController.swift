//
//  GameDetailsViewController.swift
//  Games
//
//  Created by Abdulrahman Essa on 17/08/2021.
//

import UIKit
import SharedUI
import GameExchangeSDK

public class GameDetailsViewController : UIViewController
{
    var ui = GameDetailsView()
    var developersController = DeveloperListViewController.singleRow(models: [], itemLimit: 0)

    var game : Game? = nil
    var screenShots: [String]? = nil

    var id : Int = 3498
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        hideNavbarIfFirstController()
        addChild(developersController)
        
        fetchData(id: id)
    }
    
    private func fetchData(id: Int)
    {
        Game.details(id: id) { result in
            self.game = result
            print(result.name)
            
            DispatchQueue.main.async {
                self.reloadData()
            }
            
        } failure: { error in
            print(error)
        }
        
    }
    
    private func reloadData()
    {
        guard let game = game else {return}
        developersController.removeFromParent()
        developersController = DeveloperListViewController.singleRow(models: game.developers ?? [], itemLimit: 0)
        addChild(developersController)
        
        ui.entity = .init(listing: GameListingEntity.map(model: game, screenShots: screenShots), developersView: developersController.view)
    }
}

public extension GameDetailsViewController {
    
    static func details( ofGame game: Game, screenShots: [String]?) -> GameDetailsViewController
    {
        let controller : GameDetailsViewController = {
            let c = GameDetailsViewController()
            c.game = game
            c.screenShots = screenShots
            return c
        }()
        return controller
    }
    
    static func details(forGameWithId id: Int, screenShots: [String]?) -> GameDetailsViewController
    {
        let controller : GameDetailsViewController = {
            let c = GameDetailsViewController()
            c.id = id
            c.screenShots = screenShots
            return c
        }()
        return controller
    }
}
