//
//  EmptySectionHeader.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 08/04/2021.
//

import UIKit

public class EmptySectionHeader : UIView
{
    
    public var matchBackgroundToSuperview = true
    // Changes the background color to match the superview
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if (matchBackgroundToSuperview) {
        backgroundColor = superview?.backgroundColor
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        addConstraint(heightAnchor.constraint(equalToConstant: 1))
    }
}
