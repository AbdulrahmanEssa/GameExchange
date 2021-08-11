//
//  ParentPlatform.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class ParentPlatform : Codable {
    public var platform : Platform?
    
    public init(platform: Platform? = nil) {
        self.platform = platform
    }
}
