//
//  Platform.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Platform : Codable {
    public var gamesCount: Int?
    public var id: Int?
    public var image: String?
    public var imageBackground: String?
    public var name: String?
    public var slug: String?
    public var yearEnd: String?
    public var yearStart: Int?

    public init(gamesCount: Int?, id: Int?, image: String?, imageBackground: String?, name: String?, slug: String?, yearEnd: String?, yearStart: Int?) {
        self.gamesCount = gamesCount
        self.id = id
        self.image = image
        self.imageBackground = imageBackground
        self.name = name
        self.slug = slug
        self.yearEnd = yearEnd
        self.yearStart = yearStart
    }
}
