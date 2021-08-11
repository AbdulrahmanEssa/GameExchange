//
//  BarView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 05/04/2021.
//

import UIKit

public class TitleAccessoryView : UIView
{
    public var title : String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    public var titleFont: UIFont? {
        didSet{
            titleLabel.font = titleFont
        }
    }
    
    public var titleColor : UIColor? {
        didSet{
            titleLabel.textColor = titleColor
        }
    }
    
    lazy var titleLabel : UILabel = {
        let l = UILabel()
        l.text = title
        l.font = fonts.paragraph
        l.textColor = colors.title
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubview(titleLabel)
        
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
}
