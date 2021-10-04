//
//  GameHeaderView\.swift
//  Games
//
//  Created by Abdulrahman Essa on 17/08/2021.
//

import UIKit

class GameHeaderView : UIView
{
    lazy var name : UILabel = {
        let l = UILabel()
        l.text = "Bloodborne"
        l.font = fonts.title
        l.textColor = colors.title
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var rating : MetacriticBadgeView = {
        let mbv = MetacriticBadgeView()
        mbv.entity = .demo
        mbv.translatesAutoresizingMaskIntoConstraints = false
        return mbv
    }()

    lazy var releaseDate: UILabel = {
        let l = UILabel()
        l.text = "2012/10/17"
        l.font = fonts.subtitle
        l.textColor = colors.subtitle
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    lazy var otherLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "slug"
        lbl.font = fonts.subtitle
        lbl.textColor = colors.subtitle
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var entity: GameListingEntity.Header? {
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
        
        addSubviews([name, rating,otherLabel, releaseDate])
        addConstraints([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            rating.topAnchor.constraint(equalTo: name.topAnchor, constant: 0),
            rating.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 10),
            rating.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            rating.bottomAnchor.constraint(lessThanOrEqualTo: name.bottomAnchor),
            rating.widthAnchor.constraint(equalTo: rating.heightAnchor, multiplier: 1, constant: 0),
            rating.heightAnchor.constraint(equalToConstant: 50),
            
            otherLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            otherLabel.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: 0),
            otherLabel.bottomAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 0),
            
            releaseDate.topAnchor.constraint(equalTo: otherLabel.topAnchor, constant: 0),
            releaseDate.leadingAnchor.constraint(equalTo: otherLabel.trailingAnchor, constant: 10),
            releaseDate.trailingAnchor.constraint(equalTo: rating.trailingAnchor, constant: -10),
            releaseDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
        
        releaseDate.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        name.text = e.name
        rating.entity = .init(rating: e.rating, scoreSource: nil)
        releaseDate.text = e.releaseDate
        otherLabel.text = e.otherLabel
        
    }
}
