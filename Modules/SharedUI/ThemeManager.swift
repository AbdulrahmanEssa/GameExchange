//
//  ThemeManager.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol ThemeManagerDelegate : AnyObject
{
    func themeManager(didChangeThemeAt instance: ThemeManager)
}

public class ThemeManager
{
    public static var instance : ThemeManager = ThemeManager()
    public var delegate : ThemeManagerDelegate?
    
    public private(set) var theme : Theme = DefaultTheme()

    private init ()
    {
    }
    
    public func set(theme: Theme)
    {
        self.theme = theme
        delegate?.themeManager(didChangeThemeAt: self)
    }
}
