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
    struct Entity {
        let name : String?
        let developer: String?
        let rating : String?
        let images: [String]?
        
        static let demo = Entity.init(name: "Bloodborne", developer: "From Software", rating: "10/10", images: ["placeholder_game_image", "placeholder_game_image", "placeholder_game_image", "placeholder_game_image"])
    }
    
    let imageHeight : CGFloat = 230
    
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
    
    lazy var developer : UILabel = {
        let l = UILabel()
        l.text = "From Software"
        l.font = fonts.subtitle
        l.textColor = colors.subtitle
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var rating : UILabel = {
        let l = UILabel()
        l.text = "10/10"
        l.font = fonts.subtitle
        l.textColor = colors.primary
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
    
    lazy var separator = Separator()
    
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        backgroundColor = colors.background
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubviews([name, developer, rating, images, separator])
        
        addConstraints([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            developer.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            developer.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: 0),
            
            rating.topAnchor.constraint(equalTo: developer.topAnchor, constant: 0),
            rating.leadingAnchor.constraint(equalTo: developer.trailingAnchor, constant: 0),
            rating.trailingAnchor.constraint(equalTo: name.trailingAnchor, constant: -10),
            
            images.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 0),
            images.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            images.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            images.heightAnchor.constraint(equalToConstant: imageHeight),
            
            separator.topAnchor.constraint(equalTo: images.bottomAnchor, constant: 10),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  0),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    func reloadData()
    {
        guard let e = entity else {return}
        name.text = e.name
        developer.text = e.developer
        rating.text = e.rating
        
        var imgs : [UIView] = []
        
        e.images?.forEach({ imageString in
            let image : UIImageView = {
                let iv = UIImageView()
                iv.trySetImage(named: imageString)
                iv.translatesAutoresizingMaskIntoConstraints = false;
                iv.addConstraints([
                    iv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                    iv.heightAnchor.constraint(equalToConstant: imageHeight)
                ])
                return iv;
            }()
            
            imgs.append(image)
        })
        
        images.views = imgs
        
    }
}

class GameSummaryTableViewCell: UITableViewCell
{
    static let id = "GameSummaryTableViewCell"
}

//    public var id : Int?                                      NO SHOW
//    public var added : Int?                                   NO SHOW
//    public var addedByStatus : AddedByStatus?                 NO SHOW
//    public var backgroundImage : String?                      READY
//    public var clip : String?                                 NO SHOW
//    public var dominantColor : String?                        MAYBE
//    public var esrbRating : ESRBRating?                       SHOW
//    public var genres : [Genre]?                              SHOW
//    public var metacritic : Int?                              SHOW
//    public var name : String?                                 READY
//    public var parentPlatforms : [ParentPlatform]?            NO SHOW
//    public var platforms : [Platform]?                        NO SHOW
//    public var playtime : Int?                                NO SHOW
//    public var rating : Double?                               NO SHOW
//    public var ratingTop : Int?                               NO SHOW
//    public var ratings : [Rating]?                            NO SHOW
//    public var ratingsCount : Int?                            NO SHOW
//    public var released : String?                             SHOW
//    public var reviewsCount : Int?                            NO SHOW
//    public var reviewsTextCount : Int?                        NO SHOW
//    public var saturatedColor : String?                       NO SHOW
//    public var shortScreenshots : [ShortScreenshot]?          READY
//    public var slug : String?                                 NO SHOW
//    public var stores : [StoreListing]?                       NO SHOW
//    public var suggestionsCount : Int?                        NO SHOW
//    public var tags : [Tag]?                                  NO SHOW
//    public var tba : Bool?                                    SHOW
//    public var updated : String?                              NO SHOW
//    public var userGame : String?                             NO SHOW
