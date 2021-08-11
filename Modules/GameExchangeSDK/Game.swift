//
//  Game.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation
import NetworkService

public class Game : Codable {
    public var id : Int?
    public var added : Int?
    public var addedByStatus : AddedByStatus?
    public var backgroundImage : String?
    public var clip : String?
    public var dominantColor : String?
    public var esrbRating : ESRBRating?
    public var genres : [Genre]?
    public var metacritic : Int?
    public var name : String?
    public var parentPlatforms : [ParentPlatform]?
    public var platforms : [Platform]?
    public var playtime : Int?
    public var rating : Double?
    public var ratingTop : Int?
    public var ratings : [Rating]?
    public var ratingsCount : Int?
    public var released : String?
    public var reviewsCount : Int?
    public var reviewsTextCount : Int?
    public var saturatedColor : String?
    public var shortScreenshots : [ShortScreenshot]?
    public var slug : String?
    public var stores : [StoreListing]?
    public var suggestionsCount : Int?
    public var tags : [Tag]?
    public var tba : Bool?
    public var updated : String?
    public var userGame : String?
    
    public init(id: Int? = nil, added: Int? = nil, addedByStatus: AddedByStatus? = nil, backgroundImage: String? = nil, clip: String? = nil, dominantColor: String? = nil, esrbRating: ESRBRating? = nil, genres: [Genre]? = nil, metacritic: Int? = nil, name: String? = nil, parentPlatforms: [ParentPlatform]? = nil, platforms: [Platform]? = nil, playtime: Int? = nil, rating: Double? = nil, ratingTop: Int? = nil, ratings: [Rating]? = nil, ratingsCount: Int? = nil, released: String? = nil, reviewsCount: Int? = nil, reviewsTextCount: Int? = nil, saturatedColor: String? = nil, shortScreenshots: [ShortScreenshot]? = nil, slug: String? = nil, stores: [StoreListing]? = nil, suggestionsCount: Int? = nil, tags: [Tag]? = nil, tba: Bool? = nil, updated: String? = nil, userGame: String? = nil) {
        self.id = id
        self.added = added
        self.addedByStatus = addedByStatus
        self.backgroundImage = backgroundImage
        self.clip = clip
        self.dominantColor = dominantColor
        self.esrbRating = esrbRating
        self.genres = genres
        self.metacritic = metacritic
        self.name = name
        self.parentPlatforms = parentPlatforms
        self.platforms = platforms
        self.playtime = playtime
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratings = ratings
        self.ratingsCount = ratingsCount
        self.released = released
        self.reviewsCount = reviewsCount
        self.reviewsTextCount = reviewsTextCount
        self.saturatedColor = saturatedColor
        self.shortScreenshots = shortScreenshots
        self.slug = slug
        self.stores = stores
        self.suggestionsCount = suggestionsCount
        self.tags = tags
        self.tba = tba
        self.updated = updated
        self.userGame = userGame
    }
    
    public static func list(page: Int, success: @escaping Success<GameList>, failure: @escaping Failure)
    {
        Router.game.list(page: 1).request { gameList in
            success(gameList)
        } failure: { error in
            failure(error)
        }

    }
}
