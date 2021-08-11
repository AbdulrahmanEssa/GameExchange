//
//  DarkColors.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 08/08/2021.
//

import UIKit

public class DarkColors : ColorTheme
{
    // Brand Colors
    public var primary: UIColor = UIColor(red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
    public var secondary: UIColor = .white
    public var tertiary: UIColor = .black
    
    // Common Colors
    public var warning: UIColor = UIColor.systemRed
    public var valid: UIColor = UIColor.systemGreen
    public var contrast: UIColor = .white
    
     // View Colors
    public var void: UIColor = .black
    public var background: UIColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
    public var separator: UIColor = .black
    public var shadow: UIColor = UIColor(red: 110/255, green: 120/255, blue: 130/255, alpha: 0.12)
    
     // Text Colors
    public var title: UIColor = .white
    public var subtitle: UIColor = .systemGray
    public var paragraph: UIColor = .systemGray2
    public var placeholder: UIColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    
     // Button Colors
    public lazy var buttonBackground: UIColor =  primary // UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    public lazy var buttonText: UIColor = tertiary
    public lazy var buttonBackgroundTapped: UIColor = tertiary
    public lazy var buttonTextTapped: UIColor = secondary

    public var tabBarStyle : UIBarStyle = .black
    public lazy var tabBarTintColor : UIColor = primary
    public lazy var tabBarBackgroundTint : UIColor = background
    public lazy var tabBarUnselectedItemTint : UIColor = separator
}
