//
//  BaseView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 19/04/2021.
//

import UIKit

open class BaseView: UIView
{
    var margins: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    
    var contentView: UIView = UIView()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        addSubview(contentView)
        
        addConstraints([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: margins.top),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: margins.right),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: margins.bottom),
        ])
    }
}
