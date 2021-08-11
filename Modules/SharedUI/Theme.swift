//
//  Theme.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol Theme
{
    var name: String {get}
    
    var colors: ColorTheme {get}
    
    var fonts: FontTheme {get}
    
    var assets: AssetTheme {get}
}
