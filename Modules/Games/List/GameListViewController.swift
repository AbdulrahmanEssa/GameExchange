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
    public enum ViewMode {
        case cover
        case summary
    }
    
    private var ui = GameListView()
    
    private var page : Int = 1
    private var scrollDirection : UICollectionView.ScrollDirection = .vertical
    private var viewMode : ViewMode = .cover
    private var itemLimit: Int = 0
    
    private var games : [Game] = []
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        ui.entity = .demo
        ui.scrollDirection = scrollDirection
        ui.delegate = self
        hideNavbarIfFirstController()
        fetchData(page: page, additive: false)
    }
    
    public func showNextPage(additive: Bool)
    {
        fetchData(page: page + 1, additive: additive)
    }
    
    public func showPreviousPage(additive: Bool)
    {
        fetchData(page: page - 1, additive: additive)
    }
    
    private func fetchData(page: Int, additive: Bool)
    {
        Game.list(page: page) { gameList in
            print("success")
            guard let results = gameList.results else {return}
            self.games = additive ? results : self.games + results
            self.page = page
            
            DispatchQueue.main.async {
                self.reloadData()
            }
            
        } failure: { error in
            print(error)
        }
    }
    
    private func generateListingCells(entities: [GameListingEntity]) -> [GameListView.CellEntity]
    {
        var cellEntities: [GameListView.CellEntity] = []
        switch viewMode {
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
        var list : [GameListingEntity] = games.map({GameListingEntity.map(model: $0)})
        
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
    
    public static func grid(page: Int, itemLimit: Int) -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.page = page
            c.itemLimit = itemLimit
            c.viewMode = .cover
            c.scrollDirection = .vertical
            return c
        }()
        
        return controller
    }
    
    public static func list(page:Int, itemLimit: Int) -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.page = page
            c.viewMode = .summary
            c.itemLimit = itemLimit
            c.scrollDirection = .vertical
            return c
        }()
        
        return controller
    }
    
    public static func singleRow(page: Int, itemLimit: Int, viewMode: ViewMode) -> GameListViewController
    {
        let controller : GameListViewController = {
            let c = GameListViewController()
            c.page = page
            c.viewMode = viewMode
            c.itemLimit = itemLimit
            c.scrollDirection = .horizontal
            return c
        }()
        
        return controller
    }
}

extension GameListViewController : GameListViewDelegate {
    func gameList(_ view: GameListView, didSelectGameWith indexPath: IndexPath) {
        let controller = GameDetailsViewController.details(forGameWithId: (games[indexPath.row].id ?? 0), screenShots: games[indexPath.row].shortScreenshots?.map({$0.image ?? ""}))
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


