//
//  ParagraphView.swift
//  Games
//
//  Created by Abdulrahman Essa on 13/10/2021.
//

import UIKit
import SharedUI

class ParagraphView : UIView
{
    struct Entity {
        var title : String?
        var description : String?
        var expanded : Bool
        
        static let demo = Entity(title: "Description",
                                 description: "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \r\nSimultaneous storytelling from three unique perspectives: \r\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \r\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.",
                                 expanded: false)
    }
    
    private lazy var collapseButton : UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(didTapCollapse), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false;
        return btn;
    }()
    
    private lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.font = fonts.title
        lbl.textColor = colors.title
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var icon : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: assets.arrowheadLeft)?.withTintColor(colors.title)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \r\nSimultaneous storytelling from three unique perspectives: \r\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \r\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged."
        lbl.font = fonts.paragraph
        lbl.textColor = colors.title
        lbl.numberOfLines = 200
        lbl.textAlignment = .left
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
        
        backgroundColor = colors.void
        setupLayout()
    }
    
    @objc private func didTapCollapse() {
        if (entity != nil)
        {
            entity!.expanded = !entity!.expanded
            let imageString = entity!.expanded ? assets.arrowheadDown : assets.arrowheadLeft
            icon.image = UIImage(named: imageString)?.withTintColor(colors.title)
        }
    }
    
    private func setupLayout()
    {
        addSubviews([titleLabel, descriptionLabel, icon, collapseButton])
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            icon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            icon.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 0),
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 1),
            icon.heightAnchor.constraint(equalToConstant: 20),
            
            collapseButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0),
            collapseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            collapseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collapseButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        titleLabel.text = e.title
        descriptionLabel.text = e.description
        descriptionLabel.isHidden = !e.expanded
        
        descriptionLabel.isHidden ? descriptionLabel.removeFromSuperview() : addSubview(descriptionLabel)
    }
}

