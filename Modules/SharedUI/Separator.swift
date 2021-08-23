//
//  Separator.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 15/07/2021.
//

import UIKit

public class Separator : UIView
{
    public var height : CGFloat = 1 {
        didSet{
            heightConstraint?.constant = height
            setNeedsUpdateConstraints()
        }
    }
    
    var heightConstraint: NSLayoutConstraint?
    
    convenience init()
    {
        self.init(frame: .zero)
        backgroundColor = colors.separator
        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = heightAnchor.constraint(equalToConstant: height)
        heightConstraint?.isActive = true
    }
}
