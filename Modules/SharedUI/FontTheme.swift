//
//  FontTheme.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol FontTheme
{
    var title : UIFont {get}
    var subtitle : UIFont {get}
    var paragraph : UIFont {get}
    
    var cardTitle: UIFont {get}
    var cardSubtitle: UIFont {get}
    var cardAnnotation : UIFont {get}
    
    var buttonTitle : UIFont {get}
    var textField : UIFont {get}
}
