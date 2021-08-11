//
//  TripMarker.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 15/04/2021.
//

import UIKit

public class TripMarker : UIView
{
    lazy var dot : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: "tripmarker_dot")
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var line : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: "tripmarker_line")
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = .clear
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubviews([dot, line])
        
        addConstraints([
            dot.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            dot.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            dot.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            dot.widthAnchor.constraint(equalTo: heightAnchor),
            dot.heightAnchor.constraint(equalToConstant: 15),
            
            
            line.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: dot.leadingAnchor, constant: -4),
        ])
    }
}
