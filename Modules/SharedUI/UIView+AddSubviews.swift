//
//  UIView+AddSubviews.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public extension UIView
{
    func addSubviews(_ views: [UIView])
    {
        for view in views
        {
            addSubview(view)
        }
    }
}

public extension UIStackView
{
    func addArrangedSubviews(_ views: [UIView])
    {
        for view in views
        {
            addArrangedSubview(view)
        }
    }
}
