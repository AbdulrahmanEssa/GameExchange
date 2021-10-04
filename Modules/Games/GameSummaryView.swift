//
//  GameSummaryView.swift
//  Games
//
//  Created by Abdulrahman Essa on 09/08/2021.
//

import UIKit
import SharedUI

class GameSummaryView : UIView
{
    let imageHeight : CGFloat = 230
    
    lazy var header: GameHeaderView = {
        let ghv = GameHeaderView()
        ghv.entity = .init(name: "Bloodborne", rating: "92", releaseDate: "20012/10/6", otherLabel: "From Software")
        ghv.translatesAutoresizingMaskIntoConstraints = false
        return ghv
    }()
    
    lazy var genreBar : TagBarView = {
        let tbv = TagBarView()
        tbv.entity = .demo
        tbv.translatesAutoresizingMaskIntoConstraints = false;
        return tbv
    }()
    
    lazy var images : DynamicHorizontalScrollView = {
        let dsv = DynamicHorizontalScrollView()
        dsv.paginated = true
        dsv.spacing = 0
        dsv.layer.borderWidth = 4
        dsv.layer.borderColor = colors.separator.cgColor
        dsv.translatesAutoresizingMaskIntoConstraints = false
        return dsv
    }()
    
    lazy var esrb : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: assets.placeholderESRB)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var separator = Separator()
    
    
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
        separator.isHidden = true
        addSubviews([header, genreBar, images, separator,])
        
        addConstraints([
            
            header.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            genreBar.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5),
            genreBar.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 0),
            genreBar.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 0),
            
            images.topAnchor.constraint(equalTo: genreBar.bottomAnchor, constant: 5),
            images.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 0),
            images.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 0),
            images.heightAnchor.constraint(equalToConstant: imageHeight),
            
            separator.topAnchor.constraint(equalTo: images.bottomAnchor, constant: 10),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  0),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
        
        images.addSubview(esrb)
        
        images.addConstraints([
            esrb.topAnchor.constraint(greaterThanOrEqualTo: images.topAnchor, constant: 0),
            esrb.leadingAnchor.constraint(greaterThanOrEqualTo: images.leadingAnchor, constant: 0),
            esrb.trailingAnchor.constraint(equalTo: images.trailingAnchor, constant: -10),
            esrb.bottomAnchor.constraint(equalTo: images.bottomAnchor, constant: -10),
            esrb.widthAnchor.constraint(equalTo: esrb.heightAnchor, multiplier: 2/3, constant: 0),
            
            esrb.widthAnchor.constraint(equalToConstant: 40),
            esrb.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        header.entity = e.header
        genreBar.entity = .init(genres: e.genres ?? [])
        
        var imgs : [UIView] = []
        
        e.images?.forEach({ imageString in
            let image : UIImageView = {
                let iv = UIImageView()
                iv.trySetImage(named: imageString)
                iv.translatesAutoresizingMaskIntoConstraints = false;
                iv.addConstraints([
                    iv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
                    iv.heightAnchor.constraint(equalToConstant: imageHeight)
                ])
                return iv;
            }()
            
            imgs.append(image)
        })
        
        images.views = imgs
    }
}

class GameSummaryCollectionViewCell: UICollectionViewCell
{
    static let id = "UICollectionViewCell"
}
