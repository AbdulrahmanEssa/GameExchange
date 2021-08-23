//
//  ParentPlatform.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class ParentPlatform : Codable {
    public var platform : Platform?
    public var requirements : Requirements?
    public var releasedAt : String?
    
    public init(platform: Platform? = nil, requirements: Requirements? = nil, releasedAt: String? = nil) {
        self.platform = platform
        self.releasedAt = releasedAt
        self.requirements = requirements
    }
}
