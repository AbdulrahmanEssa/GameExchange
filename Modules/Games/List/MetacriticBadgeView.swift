//
//  MetacriticBadge.swift
//  Games
//
//  Created by Abdulrahman Essa on 11/08/2021.
//

import UIKit

class MetacriticBadgeView : UIView
{
    struct Entity {
        var rating: String?
        var scoreSource: String?
        
        static var demo = Entity(rating: "92", scoreSource: "User")
    }
    
    lazy var backgroundView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: assets.metacriticBadge)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 1
        iv.layer.borderColor = colors.separator.cgColor
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var ratingLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "92"
        lbl.font = fonts.title
        lbl.textColor = colors.contrast
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.minimumScaleFactor = 0.2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var sourceLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "User Score"
        lbl.font = fonts.paragraph
        lbl.textColor = colors.title
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        layer.borderWidth = 1
        layer.borderColor = colors.separator.cgColor
        layer.masksToBounds = true
        
        clipsToBounds = true;
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubviews([backgroundView, ratingLabel, sourceLabel])
        
        addConstraints([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            
            ratingLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 5),
            ratingLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -5),
            ratingLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -5),
            
            sourceLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            sourceLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0),
            sourceLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -0),
            sourceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = bounds.width/2
        
        super.draw(rect)
    }
    
    func reloadData()
    {
        guard let e = entity else {return}
        
        ratingLabel.text = e.rating
        sourceLabel.isHidden = e.scoreSource == nil
        sourceLabel.text = e.scoreSource
        
    }
}
