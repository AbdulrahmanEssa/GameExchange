//
//  Platform.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Platform : Codable {
    public var id : Int?
    public var slug : String?
    public var name : String?
    
    public init(id: Int? = nil, slug: String? = nil, name: String? = nil) {
        self.id = id
        self.slug = slug
        self.name = name
    }
}
