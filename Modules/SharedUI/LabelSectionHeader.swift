//
//  LabelSectionHeader.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 07/04/2021.
//

import UIKit

public class LabelSectionHeader : UIView
{
    public var title : String?{
        didSet{
            titleLabel.text = title
        }
    }
    
    public var font : UIFont? {
        didSet{
            titleLabel.font = font
        }
    }
    
    public var textColor: UIColor? {
        didSet{
            titleLabel.textColor = textColor
        }
    }
    
    lazy var titleLabel : UILabel = {
        let l = UILabel()
        l.text = "Achievements"
        l.font = fonts.subtitle
        l.textColor = colors.subtitle
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        setupLayout()
    }
    
    func setupLayout()
    {
        
        addSubviews([titleLabel])
        
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
    
}
