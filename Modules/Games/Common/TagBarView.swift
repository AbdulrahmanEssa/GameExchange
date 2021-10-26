//
//  TagsView.swift
//  Games
//
//  Created by Abdulrahman Essa on 11/08/2021.
//

import UIKit
import SharedUI

class TagBarView : UIView
{
    struct Entity {
        var tags : [String]
        
        static var demo = Entity(tags: ["Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch"])
    }
    
    lazy var scrollView: DynamicHorizontalScrollView = {
        let dsv = DynamicHorizontalScrollView()
        dsv.paginated = false
        dsv.spacing = 10
        dsv.translatesAutoresizingMaskIntoConstraints = false;
        return dsv
    }()
    
    var entity: Entity? {
        didSet{
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
        
        addConstraints([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        var genreLabels : [UIView] = []
        
        for genre in e.tags {
            
            let genreView : TagView = {
                let tv = TagView()
                tv.text = genre
                tv.translatesAutoresizingMaskIntoConstraints = false
                return tv
            }()
            genreLabels.append(genreView)
        }

        scrollView.views = genreLabels
    }
}
