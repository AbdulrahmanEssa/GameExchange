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
    enum CellMode {
        case cover
        case summary
    }
    
    private var ui = GameListView()
    
    private var currentPage : Int = 1
    
    private var cellMode : CellMode = .cover
    {
        didSet{
            reloadData()
        }
    }
    private var itemLimit: Int = 0
    {
        didSet{
            reloadData()
        }
    }
    
    private var games : [Game] = []
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        ui.entity = .demo
//        ui.scrollDirection = .vertical
        hideNavbarIfFirstController()
        //        fetchData()
    }
    
    public func showNextPage(additive: Bool)
    {
        fetchData(page: currentPage + 1, additive: additive)
    }
    
    public func showPreviousPage(additive: Bool)
    {
        fetchData(page: currentPage - 1, additive: additive)
    }
    
    private func fetchData(page: Int, additive: Bool)
    {
        Game.list(page: page) { gameList in
            print("success")
            guard let results = gameList.results else {return}
            self.games = additive ? results : self.games + results
            self.currentPage = page
            
            DispatchQueue.main.async {
                self.reloadData()
            }
            
        } failure: { error in
            print(error)
        }
    }
    
    private func map(model : Game) -> GameListingEntity
    {
        return GameListingEntity.init(header: .init(name: model.name,
                                                    rating: String(model.metacritic ?? 0),
                                                    releaseDate: model.released,
                                                    otherLabel: model.slug),
                                      genres: model.genres?.map({$0.name ?? ""}),
                                      images: model.shortScreenshots?.map({$0.image ?? ""}))
    }
    
    private func generateListingCells(entities: [GameListingEntity]) -> [GameListView.CellEntity]
    {
        var cellEntities: [GameListView.CellEntity] = []
        switch cellMode {
        case .cover:
            for item in entities {
                cellEntities.append(.cover(entity: item))
            }
        case .summary:
            for item in entities {
                cellEntities.append(.summary(entity: item))
            }
        }
        
        return cellEntities
    }
    
    private func reloadData()
    {
        var list : [GameListingEntity] = games.map({self.map(model: $0)})
        
        if list.count == 0 {
            list = [.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo,]
        }
        
        list = (itemLimit == 0) ? list : Array(list.prefix(upTo: itemLimit))
        
        ui.entity = .init(sections: [.init(header: nil,
                                           cells: generateListingCells(entities: list),
                                           footer: nil)])
    }
}

/// Access Points
extension GameListViewController {
    
    public static func grid() -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.cellMode = .cover
            c.ui.scrollDirection = .vertical
            return c
        }()
        
        return controller
    }
    
    public static func summaries(itemLimit: Int, direction: UICollectionView.ScrollDirection) -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.cellMode = .summary
            c.ui.scrollDirection = direction
            c.itemLimit = itemLimit
            return c
        }()
        
        return controller
    }
    
    public static func singleRow(itemLimit: Int) -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.cellMode = .cover
            c.itemLimit = itemLimit
            c.ui.scrollDirection = .horizontal
            return c
        }()
        
        return controller
    }
}
