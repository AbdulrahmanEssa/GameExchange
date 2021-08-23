//
//  ImageTheme.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 21/04/2021.
//

import UIKit

public protocol AssetTheme {
    
    // Common
    var logo : String {get}
    var secondaryLogo : String {get}
    var textLogo : String {get}
    var secondaryTextLogo : String {get}
    
    // Placeholders
    var placeholderGameImage : String {get}
    var placeholderESRB : String {get}
    
    // Games
    var metacriticBadge : String {get}
}
