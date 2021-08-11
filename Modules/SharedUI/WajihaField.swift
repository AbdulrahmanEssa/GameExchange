//
//  WajihaField.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class WajihaField: UIView
{
    public lazy var label : UILabel = {
        let l = UILabel()
        l.text = ""
        l.font = fonts.title
        l.textColor = colors.subtitle
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    public lazy var font : UIFont = fonts.textField {
        didSet{
            label.font = font
        }
    }
    
    public lazy var textColor: UIColor = colors.title{
        didSet{
            reloadData()
        }
    }
    
    public lazy var placeholderColor: UIColor = colors.subtitle {
        didSet{
            reloadData()
        }
    }
    
    public lazy var placeholder: String = ""
    {
        didSet{
            reloadData()
        }
    }
    
    public lazy var text : String = ""
    {
        didSet{
            reloadData()
        }
    }
    
    public lazy var textAlignment : NSTextAlignment = .left
    {
        didSet{
            label.textAlignment = textAlignment
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupAppearance()
        
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubview(label)
        
        addConstraints([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    func setupAppearance()
    {
        layer.borderWidth = 2
        layer.borderColor = colors.separator.cgColor
        layer.cornerRadius = 8
        backgroundColor = colors.background
    }
    
    func reloadData()
    {
        if (text == "")
        {
            label.text = placeholder
            label.textColor = placeholderColor
        }
        else
        {
            label.text = text
            label.textColor = textColor
        }
    }
}
