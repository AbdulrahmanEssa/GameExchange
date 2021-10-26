//
//  GameCoverView.swift
//  Games
//
//  Created by Abdulrahman Essa on 01/10/2021.
//

import UIKit
import SharedUI


class GameCoverCollectionViewCell : UICollectionViewCell
{
    static let id = "GameCoverCollectionViewCell"
}

class GameCoverView : UIView
{
    lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: assets.placeholderGameImage)
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Bloodborne"
        lbl.font = fonts.subtitle
        lbl.textColor = colors.contrast
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.minimumScaleFactor = 0.7
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var entity: GameListingEntity? {
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
        addSubviews([imageView, nameLabel])
        
        addConstraints([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.25),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 2),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -2),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        nameLabel.text = e.header.name
        imageView.trySetImage(named: e.images?[0])
    }
}
