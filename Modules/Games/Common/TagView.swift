//
//  TagView.swift
//  Games
//
//  Created by Abdulrahman Essa on 15/08/2021.
//

import UIKit
import SharedUI


class TagView : UIView {
    
    lazy var label : UILabel = {
        let lbl = UILabel()
        lbl.text = "Action"
        lbl.font = fonts.paragraph
        lbl.textColor = colors.subtitle
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var text : String? {
        didSet{
            label.text = text
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        
        layer.borderWidth = 1
        layer.borderColor = colors.subtitle.cgColor
        layer.cornerRadius = 8
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(label)
        
        addConstraints([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5 ),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
        ])
    }
}
