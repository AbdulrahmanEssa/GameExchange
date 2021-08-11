//
//  TitleDescriptionView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 06/04/2021.
//

import UIKit

public protocol TitleDescriptionViewDelegate : AnyObject
{
    func titleDescription(_ view: TitleDescriptionView, didTapViewTitled title: String)
}

public class TitleDescriptionView : TitleAccessoryView
{
    public var descriptionText: String? {
        didSet{
            descriptionLabel.text = descriptionText
        }
    }
    
    public var descriptionFont: UIFont? {
        didSet{
            descriptionLabel.font = descriptionFont
        }
    }
    
    public var descriptionColor: UIColor? {
        didSet{
            descriptionLabel.textColor = descriptionColor
        }
    }
    
    public weak var delegate : TitleDescriptionViewDelegate?
    
    lazy var descriptionLabel : UILabel = {
        let l = UILabel()
        l.text = "Description"
        l.font = fonts.paragraph
        l.textColor = colors.title
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var tapButton : WajihaButton = {
        let bb = WajihaButton()
        bb.setTitle("", for: .normal)
        bb.setTitleColor(colors.buttonText, for: .normal)
        bb.backgroundColor = .clear
        bb.animated = false
        bb.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    }()
    
    override func setupLayout() {
        addSubviews([ titleLabel, descriptionLabel, tapButton])
        
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            descriptionLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -0),
            
            tapButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tapButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            tapButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    @objc
    func onTap()
    {
        delegate?.titleDescription(self, didTapViewTitled: title ?? "")
    }

}

public class TitleDescriptionTableViewCell : UITableViewCell
{
    public static let id = "TitleDescriptionTableViewCell"
}
