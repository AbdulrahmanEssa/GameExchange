//
//  Genre.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Genre : Codable {
    public var id : Int?
    public var games_count : Int?
    public var imageBackground : String?
    public var name : String?
    public var slug : String?
    
    public init(id: Int? = nil, games_count: Int? = nil, imageBackground: String? = nil, name: String? = nil, slug: String? = nil) {
        self.id = id
        self.games_count = games_count
        self.imageBackground = imageBackground
        self.name = name
        self.slug = slug
    }
}
