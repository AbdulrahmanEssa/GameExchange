//
//  Tag.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Tag : Codable {
    public var id : Int?
    public var gamesCount : Int?
    public var imageBackground : String?
    public var language : String?
    public var name : String?
    public var slug : String?
    
    public init(id: Int? = nil, gamesCount: Int? = nil, imageBackground: String? = nil, language: String? = nil, name: String? = nil, slug: String? = nil) {
        self.id = id
        self.gamesCount = gamesCount
        self.imageBackground = imageBackground
        self.language = language
        self.name = name
        self.slug = slug
    }
}
