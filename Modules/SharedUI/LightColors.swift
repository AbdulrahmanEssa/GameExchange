//
//  LightColors.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class LightColors : ColorTheme
{
    // Brand Colors
    public var primary: UIColor = UIColor(red: 255/255, green: 222/255, blue: 0/255, alpha: 1)
    public var secondary: UIColor = .white
    public var tertiary: UIColor = .black
    
    // Common Colors
    public var warning: UIColor = UIColor(red: 201/255, green: 14/255, blue: 59/255, alpha: 1)
    public var valid: UIColor = UIColor(red: 0.05, green: 0.63, blue: 0.24, alpha: 1)
    public var contrast: UIColor = .white
    
     // View Colors
    public var void: UIColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1) // UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    public var background: UIColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    public var separator: UIColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    public var shadow: UIColor = UIColor(red: 110/255, green: 120/255, blue: 130/255, alpha: 0.12)
    
     // Text Colors
    public var title: UIColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    public var subtitle: UIColor = UIColor(red: 114/255, green: 105/255, blue: 80/255, alpha: 1)
    public var paragraph: UIColor = UIColor(red: 140/255, green: 140/255, blue: 120/255, alpha: 1)
    public var placeholder: UIColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    
     // Button Colors
    public lazy var buttonBackground: UIColor =  primary // UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    public lazy var buttonText: UIColor = tertiary
    public lazy var buttonBackgroundTapped: UIColor = tertiary
    public lazy var buttonTextTapped: UIColor = secondary

    public var tabBarStyle : UIBarStyle = .default
    public lazy var tabBarTintColor : UIColor = primary
    public lazy var tabBarBackgroundTint : UIColor = background
    public lazy var tabBarUnselectedItemTint : UIColor = separator
}
