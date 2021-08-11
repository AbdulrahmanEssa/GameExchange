//
//  Store.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Store : Codable {
    public var id : Int?
    public var gamesCount : Int?
    public var domain : String?
    public var imageBackground : String?
    public var name : String?
    public var slug : String?
    
    public init(id: Int? = nil, gamesCount: Int? = nil, domain: String? = nil, imageBackground: String? = nil, name: String? = nil, slug: String? = nil) {
        self.id = id
        self.gamesCount = gamesCount
        self.domain = domain
        self.imageBackground = imageBackground
        self.name = name
        self.slug = slug
    }
}
