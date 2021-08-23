//
//  TitleImageView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 18/04/2021.
//

import UIKit

public class TitleImageView: TitleAccessoryView {
    
    public var image : String?
    {
        didSet{
            imageView.trySetImage(named: image ?? "")
        }
    }
    
    lazy var imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.trySetImage(named: assets.metacriticBadge)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(imageView)
        
        addConstraints([
            imageView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalTo: heightAnchor),
        ])
        
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
