//
//  DefaultTheme.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class DefaultTheme : Theme
{
    public var name: String = "Default"
    
    public var colors: ColorTheme = DarkColors()
    
    public var fonts: FontTheme = DefaultFonts()
    
    public var assets: AssetTheme = DefaultAssets()
}
