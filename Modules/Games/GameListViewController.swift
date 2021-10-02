//
//  GameListViewController.swift
//  Games
//
//  Created by Abdulrahman Essa on 09/08/2021.
//

import UIKit
import SharedUI
import GameExchangeSDK


public class GameListViewController : UIViewController
{
    var ui = GameGridView()
    var page : Int = 1
    
    var games : [Game]? = []
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        ui.entity = .demo
        ui.scrollDirection = .vertical
        hideNavbarIfFirstController()
//        fetchData()
    }
    
    public func fetchData()
    {
        Game.list(page: self.page) { gameList in
            print("success")
            self.games = gameList.results
            self.page += 1
            
            DispatchQueue.main.async {
                self.reloadData()
            }
            
        } failure: { error in
            print(error)
        }
    }
    
    private func map(model : Game) -> GameListView.CellEntity
    {
        return GameListView.CellEntity.gameSummary(Entity: .init(header: .init(name: model.name,
                                                                               rating: String(model.metacritic ?? 0),
                                                                               releaseDate: model.released,
                                                                               otherLabel: model.slug),
                                                                 genres: model.genres?.map({$0.name ?? ""}),
                                                                 images: model.shortScreenshots?.map({$0.image ?? ""})))
    }
    
    private func reloadData()
    {
        let list : [GameListView.CellEntity]? = games?.map({self.map(model: $0)})
        
//        ui.entity = .init(sections: [.init(header: nil, cells: list, footer: nil)])
    }
}

/// Access Points
extension GameListViewController {
    
    
}
