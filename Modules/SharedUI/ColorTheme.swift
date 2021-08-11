//
//  ColorTheme.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol ColorTheme
{
    // Brand Colors
    var primary: UIColor {get}
    var secondary: UIColor {get}
    var tertiary: UIColor {get}
    
    // Common Colors
    var warning : UIColor {get}
    var valid : UIColor {get}
    /// a color that contrast clearly against the warning and valid colors
    var contrast: UIColor {get}
    
    // View Colors
    /// The color where the screen should be "empty" such as in a card view
    var void: UIColor {get}
    /// The color of the "body" of the view, text will usually be on top of this.
    var background: UIColor {get}
    /// View separator color
    var separator: UIColor {get}
    /// View shadows
    var shadow: UIColor {get}

    // Text Colors
    var title: UIColor {get}
    var subtitle: UIColor {get}
    var paragraph: UIColor {get}
    var placeholder: UIColor {get}
    
    // Buttons
    var buttonBackground: UIColor {get}
    var buttonText: UIColor {get}
    var buttonBackgroundTapped: UIColor {get}
    var buttonTextTapped: UIColor {get}
    
    var tabBarStyle : UIBarStyle {get}
    var tabBarTintColor : UIColor {get}
    var tabBarBackgroundTint : UIColor {get}
    var tabBarUnselectedItemTint : UIColor {get}
}
