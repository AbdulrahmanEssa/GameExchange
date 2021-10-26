//
//  GameDetailsView.swift
//  Games
//
//  Created by Abdulrahman Essa on 13/10/2021.
//

import UIKit
import SharedUI

class GameDetailsView : UIView
{
    struct Entity {
        var listing : GameListingEntity
        var developersView : UIView
        
        static let demo = Entity(listing: .demo, developersView: UIView())
    }
    
    private lazy var scrollView: DynamicVerticalScrollView = {
       let dsv = DynamicVerticalScrollView()
        dsv.paginated = false
        dsv.spacing = 5
        dsv.translatesAutoresizingMaskIntoConstraints = false
        return dsv
    }()
    
    private lazy var summaryView: GameSummaryView = {
        let gsv = GameSummaryView()
        gsv.entity = .demo
        gsv.translatesAutoresizingMaskIntoConstraints = false
        return gsv
    }()
    
    private lazy var tagsView: TagBarView = {
        let tbv = TagBarView()
        tbv.entity = .demo
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    }()
    
    private lazy var descriptionView : ParagraphView = {
        let dv = ParagraphView()
        dv.entity = .demo
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    var entity: Entity? {
        didSet {
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(scrollView)
        
        scrollView.views = [summaryView, tagsView, descriptionView]
        
        addConstraints([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        summaryView.entity = e.listing
        tagsView.entity = .init(tags: e.listing.tags ?? [])
        descriptionView.entity = .init(title: "Description", description: e.listing.description, expanded: false)
        
        e.developersView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.views = [summaryView, tagsView, descriptionView, e.developersView]
    }
}
