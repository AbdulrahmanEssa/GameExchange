//
//  DocumentUploadViewController.swift
//  BARQ-FLEET
//
//  Created by Abdulrahman Essa on 22/08/2021.
//  Copyright © 2021 Sam Kadri. All rights reserved.
//

import UIKit
import SharedUI

public class DocumentUploadViewController : UIViewController
{
    var ui = DocumentUploadView()
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
                ui.entity = .demo
    }
}


class DocumentUploadView : UIView
{
    struct Entity {
        let sections: [SectionEntity]?
        
        static var demo = Entity(sections: [.init(header: nil,
                                                  cells: [ .documentUpload(entity: .init(document: ThemeManager.instance.theme.assets.metacriticBadge,
                                                                                         title: "Id / Iqama")),
                                                           .documentUpload(entity: .init(document: ThemeManager.instance.theme.assets.metacriticBadge,
                                                                                         title: "Driver's License")),
                                                           .documentUpload(entity: .init(document: ThemeManager.instance.theme.assets.metacriticBadge,
                                                                                         title: "Car Registration"))
                                                  ],
                                                  footer: nil)])
    }
    
    struct SectionEntity{
        let header : UIView?
        let cells : [CellEntity]?
        let footer : UIView?
    }
    
    enum CellEntity {
        case documentUpload(entity: DocumentUploadCell.Entity)
        case cell2;
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
        tv.backgroundColor = colors.background
        tv.register(DocumentUploadCell.self, forCellReuseIdentifier: DocumentUploadCell.id)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.background
        
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

extension DocumentUploadView : UITableViewDelegate
{
    
}

extension DocumentUploadView : UITableViewDataSource
{
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return entity?.sections?[section].footer
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return entity?.sections?[section].header
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entity?.sections?[section].cells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        var view : UIView!
        
        guard let e = entity else {return UITableViewCell()}
        
        switch e.sections?[indexPath.section].cells?[indexPath.row] {
            case .documentUpload(entity: let e):
                let documentCell  : DocumentUploadCell = {
                    let duc = DocumentUploadCell()
                    duc.entity = e
                    duc.translatesAutoresizingMaskIntoConstraints = false
                    return duc
                }()
                view = documentCell
                cell = tableView.dequeueReusableCell(withIdentifier: DocumentUploadCell.id)
            case .cell2:
                break
            case .none:
                break
        }
        
        cell.backgroundColor = colors.background
        
        cell.subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
        
        view.tag = 999
        cell.addSubview(view)
        cell.addConstraints([
            view.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -0),
            view.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0),
        ])
        return  cell;
    }
}


class DocumentUploadCell : UITableViewCell
{
    static var id = "DocumentUploadTableViewCell"

    struct Entity {
        let document : String?
        let title: String?
    }
    
    lazy var titleImageView : TitleImageView = {
        let tiv = TitleImageView()
        tiv.image = assets.metacriticBadge
        tiv.title = "Iqama"
        tiv.titleFont = fonts.title
        tiv.translatesAutoresizingMaskIntoConstraints = false
        return tiv
    }()
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
        backgroundColor = .clear
    }
    
    func setupLayout()
    {
        addSubview(titleImageView)
        
        addConstraints([
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            titleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    func reloadData()
    {
        guard let e = entity else {return}
        
        titleImageView.image = e.document
        titleImageView.title = e.title
    }
}
