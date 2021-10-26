//
//  DeveloperListViewController.swift
//  Developers
//
//  Created by Abdulrahman Essa on 11/10/2021.
//

import UIKit
import GameExchangeSDK
import SharedUI
import NetworkService
import SystemConfiguration

public class DeveloperListViewController : UIViewController
{
    public enum ViewMode {
        case icon
        case label
    }
    
    private var ui = DeveloperListView()
    private var developers: [Developer] = []
    
    private var page : Int = 0
    private var viewMode : ViewMode = .icon
    private var itemLimit: Int = 0
    private var scrollDirection: UICollectionView.ScrollDirection = .vertical
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        //        ui.entity = .demo
        hideNavbarIfFirstController()
//        fetchData(page: 1, additive: false)
    }


    private func fetchData(page: Int, additive: Bool)
    {
        Developer.list(page: page) { list in
            guard let results = list.results else {return}
            self.developers = additive ? self.developers + results : results
            print("Received Developers")
            DispatchQueue.main.async {
                self.reloadData()
            }
        } failure: { error in
            print(error)
        }

    }
    
    func map(model: Developer) -> DeveloperListingEntity
    {
        return DeveloperListingEntity(name: model.name, icon: model.imageBackground)
    }
    
    func generateListingCells(entities: [DeveloperListingEntity]) -> [DeveloperListView.CellEntity] {
        var cells : [DeveloperListView.CellEntity] = []
        for item in entities{
            cells.append(.icon(entity: item))
        }
        
        return cells
    }
    
    private func reloadData()
    {
        let entities = developers.map({self.map(model:$0)})
        
        ui.entity = .init(sections: [.init(header: nil,
                                           cells: generateListingCells(entities: entities),
                                           footer: nil)])
    }
}


//Access Points
extension DeveloperListViewController {
    
    public static func list(page: Int, itemLimit: Int) -> DeveloperListViewController{
        let controller : DeveloperListViewController = {
            let c = DeveloperListViewController()
            c.page = page
            c.itemLimit = itemLimit
            c.scrollDirection = .vertical
            c.viewMode = .label
            c.fetchData(page: page, additive: false)
            return c
        }()
        return controller
    }
    
    public static func grid(page: Int, itemLimit: Int) -> DeveloperListViewController {
        let controller : DeveloperListViewController = {
            let c = DeveloperListViewController()
            c.page = page
            c.itemLimit = itemLimit
            c.scrollDirection = .vertical
            c.viewMode = .icon
            c.fetchData(page: page, additive: false)
            return c
        }()
        return controller
    }
    
    public static func singleRow(page: Int, itemLimit: Int, viewMode: ViewMode) -> DeveloperListViewController {
        let controller : DeveloperListViewController = {
            let c = DeveloperListViewController()
            c.page = page
            c.itemLimit = itemLimit
            c.scrollDirection = .horizontal
            c.viewMode = viewMode
            c.fetchData(page: page, additive: false)
            return c
        }()
        return controller
    }
    
    public static func singleRow(models: [Developer], itemLimit: Int) -> DeveloperListViewController {
        let controller : DeveloperListViewController = {
            let c = DeveloperListViewController()
            c.developers = models
            c.itemLimit = itemLimit
            c.scrollDirection = .horizontal
            c.viewMode = .icon
            c.reloadData()
            return c
        }()
        return controller
    }
}


struct DeveloperListingEntity {
    let name: String?
    let icon: String?
}
