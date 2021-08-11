//
//  GameListView.swift
//  Games
//
//  Created by Abdulrahman Essa on 09/08/2021.
//

import UIKit
import SharedUI

class GamesListView : UIView
{
    struct Entity {
        let sections: [SectionEntity]?
        static var demo = Entity(sections: [.demo])
    }
    
    struct SectionEntity{
        let header : UIView?
        let cells : [CellEntity]?
        let footer : UIView?
        
        static var demo = SectionEntity(header: EmptySectionHeader(), cells: [.demo,.demo,.demo,.demo,.demo,.demo,.demo,.demo], footer: EmptySectionHeader())
    }
    
    enum CellEntity {
        case gameSummary(Entity: GameSummaryView.Entity)
        case cell2;
        
        static var demo = gameSummary(Entity: .demo)
    }
    
    var entity : Entity? {
        didSet{
            reloadData()
        }
    }
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = colors.void
        tv.register(GameSummaryTableViewCell.self, forCellReuseIdentifier: "GameSummaryTableViewCell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubview(tableView)
        
        addConstraints([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0),
        ])
    }
    
    func reloadData()
    {
        tableView.reloadData();
        
    }
}

extension GamesListView : UITableViewDelegate
{
    
}

extension GamesListView : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return entity?.sections?[section].footer
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return entity?.sections?[section].header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entity?.sections?[section].cells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        var view : UIView!
        
        switch entity?.sections?[indexPath.section].cells?[indexPath.row] {
            case .gameSummary(Entity: let e):
                cell = tableView.dequeueReusableCell(withIdentifier: "GameSummaryTableViewCell")!
                let gameSummaryView : GameSummaryView = {
                    let gsv = GameSummaryView()
                    gsv.entity = e
                    gsv.translatesAutoresizingMaskIntoConstraints = false;
                    return gsv
                }()
                view = gameSummaryView
            case .cell2: break
            case .none : break
        }
        
        cell.backgroundColor = colors.void
        
        cell.subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
        
        view.tag = 999
        cell.contentView.addSubview(view)
        cell.contentView.addConstraints([
            view.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -0),
            view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -0),
        ])
        
        
        return cell
    }
}
