//
//  SelectableView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//


import UIKit

public protocol SelectableView : UIView
{
    func isSelected() -> Bool
    
    func becomeSelected()
    func becomeUnselected()
}
