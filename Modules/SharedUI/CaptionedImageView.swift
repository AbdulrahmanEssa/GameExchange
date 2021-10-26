//
//  CaptionedImageView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 07/10/2021.
//

import UIKit

public class CaptionedImageView : UIView
{
    public struct Entity {
        public init(caption: String?, image: String?) {
            self.caption = caption
            self.image = image
        }
        let caption : String?
        let image: String?
    }
    
    public var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    public var font: UIFont? {
        didSet{
            titleLabel.font = font
        }
    }
    
    public var textColor: UIColor? {
        didSet{
            titleLabel.textColor = textColor
        }
    }
    
    
    public lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "From Software"
        lbl.font = fonts.subtitle
        lbl.textColor = colors.paragraph
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.7
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    public lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: assets.placeholderDeveloperIcon)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    public convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubviews([titleLabel, imageView])
        
        addConstraints([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        titleLabel.text = e.caption
        imageView.trySetImage(named: e.image)
        
    }
}

public class CaptionedImageCollectionViewCell : UICollectionViewCell {
    public static let id = "CaptionedImageCollectionViewCell"
}
