//
//  UIViewController + Themes.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public extension UIViewController
{
    var colors : ColorTheme {
        return ThemeManager.instance.theme.colors
    }
    
    var fonts : FontTheme {
        return ThemeManager.instance.theme.fonts
    }
    
    var assets : AssetTheme {
        return ThemeManager.instance.theme.assets
    }
    
    func hideNavbarIfFirstController()
    {
        self.navigationController?.isNavigationBarHidden = (navigationController?.viewControllers.first?.isEqual(self) == true)
    }
}
