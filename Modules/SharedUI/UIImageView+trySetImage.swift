//
//  UIImageView+trySetImage.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit
import Kingfisher

public extension UIImageView
{
    @discardableResult
    func trySetImage(named: String?) -> Bool
    {
        guard let named = named else {return false}
        
        let i = UIImage(named: named)
        if i != nil
        {
            image = i
            return true
        }
        else
        {
            let url = URL(string: named)
            kf.setImage(with: url)
            return false
        }
    }
    
    @discardableResult
    func trySetImage(named: String?, withTint color : UIColor) -> Bool
    {
        guard let named = named else {return false}
        
        let i = UIImage(named: named)?.withTintColor(color)
        if i != nil
        {
            image = i
            return true
        }
        else
        {
            let url = URL(string: named)
            kf.setImage(with: url)
            return false
        }
    }
}
