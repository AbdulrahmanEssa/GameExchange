//
//  WajihaDoubleLabel.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class WajihaDoubleLabel : UIView
{
    public var title: String? = "Abdulrahman Essa"
    {
        didSet{
            titleLabel.text = title
        }
    }
    
    public var subtitle: String? = "iOS Developer"
    {
        didSet{
            subtitleLabel.text = subtitle
        }
    }
    
    public lazy var titleFont : UIFont = fonts.cardAnnotation
    {
        didSet{
            titleLabel.font = titleFont
        }
    }
    
    public lazy var subtitleFont : UIFont = fonts.cardAnnotation
    {
        didSet{
            subtitleLabel.font = subtitleFont
        }
    }
    
    public lazy var titleColor : UIColor = colors.title
    {
        didSet{
            titleLabel.textColor = titleColor
        }
    }
    
    public lazy var subtitleColor: UIColor = colors.subtitle
    {
        didSet{
            subtitleLabel.textColor = subtitleColor
        }
    }
    
    public lazy var alignment : NSTextAlignment = .center{
        didSet{
            titleLabel.textAlignment = alignment
            subtitleLabel.textAlignment = alignment
        }
    }
    
    public lazy var watermark : String? = nil {
        didSet{
            watermarkImage.trySetImage(named: watermark ?? "")
        }
    }
    
    private lazy var titleLabel : UILabel = {
        let l = UILabel()
        l.text = ""
        l.font = fonts.title
        l.textColor = colors.title
        l.numberOfLines = 1
        l.textAlignment = .center
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var subtitleLabel : UILabel = {
        let l = UILabel()
        l.text = ""
        l.font = fonts.title
        l.textColor = colors.subtitle
        l.numberOfLines = 0
        l.textAlignment = .center
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var watermarkImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
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
    
    private func setupLayout()
    {
        addSubviews([watermarkImage, titleLabel, subtitleLabel])
        
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            
            watermarkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            watermarkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            watermarkImage.heightAnchor.constraint(lessThanOrEqualToConstant: 24),
            watermarkImage.widthAnchor.constraint(equalTo: heightAnchor),
        ])
    }
}
