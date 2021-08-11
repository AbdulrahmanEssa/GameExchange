//
//  UIImageView+trySetImage.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit


public extension UIImageView
{
    @discardableResult
    func trySetImage(named: String) -> Bool
    {
        let i = UIImage(named: named)
        if i != nil
        {
            image = i
            return true
        }
        else
        {
            return false
        }
    }
}
