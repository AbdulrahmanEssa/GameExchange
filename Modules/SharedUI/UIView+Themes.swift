//
//  UIView+Themes.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public extension UIView
{
    var colors : ColorTheme {
        return ThemeManager.instance.theme.colors
    }
    
    var fonts : FontTheme {
        return ThemeManager.instance.theme.fonts
    }
    
    var assets : AssetTheme{
        return ThemeManager.instance.theme.assets
    }
}
