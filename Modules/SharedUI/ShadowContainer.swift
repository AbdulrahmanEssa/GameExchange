//
//  ShadowContainer.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class ShadowContainer : UIView
{
    public lazy var cornerRadius : CGFloat = 16
    {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false;
    }
    
    public override func draw(_ rect: CGRect) {
        
        layer.shadowColor = colors.shadow.cgColor
        layer.shadowPath = UIBezierPath.init(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOpacity = 1
        layer.shadowRadius = 7
        layer.shadowOffset = .init(width: 0, height: 0)
        layer.shouldRasterize = true
    }
    
    public func setupView(_ view: UIView)
    {
        cornerRadius = view.layer.cornerRadius
        view.clipsToBounds = true;
        view.layer.masksToBounds = true;
        
        addSubview(view)
        addConstraints([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
}

