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
    public var platforms : [ParentPlatform]?
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
    public var achievementsCount: Int?
    public var additionsCount: Int?
    public var alternativeNames: [String]?
    public var backgroundImageAdditional: String?
    public var creatorsCount: Int?
    public var description: String?
    public var descriptionRaw: String?
    public var developers: [Developer]?
    public var gameSeriesCount: Int?
    public var metacriticPlatforms: [MetacriticPlatform]?
    public var metacriticURL: String?
    public var moviesCount: Int?
    public var nameOriginal: String?
    public var parentAchievementsCount: Int?
    public var parentsCount: Int?
    public var publishers: [Developer]?
    public var reactions: [String: Int]?
    public var redditCount: Int?
    public var redditDescription: String?
    public var redditLogo: String?
    public var redditName: String?
    public var redditURL: String?
    public var screenshotsCount: Int?
    public var twitchCount: Int?
    public var website: String?
    public var youtubeCount: Int?

    public init(achievementsCount: Int?, added: Int?, addedByStatus: AddedByStatus?, additionsCount: Int?, alternativeNames: [String]?, backgroundImage: String?, backgroundImageAdditional: String?, clip: String?, creatorsCount: Int?, description: String?, descriptionRaw: String?, developers: [Developer]?, dominantColor: String?, esrbRating: ESRBRating?, gameSeriesCount: Int?, genres: [Genre]?, id: Int?, metacritic: Int?, metacriticPlatforms: [MetacriticPlatform]?, metacriticURL: String?, moviesCount: Int?, name: String?, nameOriginal: String?, parentAchievementsCount: Int?, parentPlatforms: [ParentPlatform]?, parentsCount: Int?, platforms: [ParentPlatform]?, playtime: Int?, publishers: [Developer]?, rating: Double?, ratingTop: Int?, ratings: [Rating]?, ratingsCount: Int?, reactions: [String: Int]?, redditCount: Int?, redditDescription: String?, redditLogo: String?, redditName: String?, redditURL: String?, released: String?, reviewsCount: Int?, reviewsTextCount: Int?, saturatedColor: String?, screenshotsCount: Int?, slug: String?, stores: [StoreListing]?, suggestionsCount: Int?, tags: [Tag]?, tba: Bool?, twitchCount: Int?, updated: String?, userGame: String?, website: String?, youtubeCount: Int?) {
        self.achievementsCount = achievementsCount
        self.added = added
        self.addedByStatus = addedByStatus
        self.additionsCount = additionsCount
        self.alternativeNames = alternativeNames
        self.backgroundImage = backgroundImage
        self.backgroundImageAdditional = backgroundImageAdditional
        self.clip = clip
        self.creatorsCount = creatorsCount
        self.description = description
        self.descriptionRaw = descriptionRaw
        self.developers = developers
        self.dominantColor = dominantColor
        self.esrbRating = esrbRating
        self.gameSeriesCount = gameSeriesCount
        self.genres = genres
        self.id = id
        self.metacritic = metacritic
        self.metacriticPlatforms = metacriticPlatforms
        self.metacriticURL = metacriticURL
        self.moviesCount = moviesCount
        self.name = name
        self.nameOriginal = nameOriginal
        self.parentAchievementsCount = parentAchievementsCount
        self.parentPlatforms = parentPlatforms
        self.parentsCount = parentsCount
        self.platforms = platforms
        self.playtime = playtime
        self.publishers = publishers
        self.rating = rating
        self.ratingTop = ratingTop
        self.ratings = ratings
        self.ratingsCount = ratingsCount
        self.reactions = reactions
        self.redditCount = redditCount
        self.redditDescription = redditDescription
        self.redditLogo = redditLogo
        self.redditName = redditName
        self.redditURL = redditURL
        self.released = released
        self.reviewsCount = reviewsCount
        self.reviewsTextCount = reviewsTextCount
        self.saturatedColor = saturatedColor
        self.screenshotsCount = screenshotsCount
        self.slug = slug
        self.stores = stores
        self.suggestionsCount = suggestionsCount
        self.tags = tags
        self.tba = tba
        self.twitchCount = twitchCount
        self.updated = updated
        self.userGame = userGame
        self.website = website
        self.youtubeCount = youtubeCount
    }
    
    public static func list(page: Int, success: @escaping Success<GameList>, failure: @escaping Failure)
    {
        Router.game.list(page: page).request(success: success, failure: failure)
    }
    
    public static func details(id: Int, success: @escaping Success<Game>, failure: @escaping Failure)
    {
        Router.game.details(id: id).request(success: success, failure: failure)
    }
}
