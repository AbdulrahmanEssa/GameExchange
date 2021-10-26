//
//  GameListingEntity.swift
//  Games
//
//  Created by Abdulrahman Essa on 03/10/2021.
//

import Foundation
import GameExchangeSDK

struct GameListingEntity {
    
    struct Header {
        let name : String?
        let rating : String?
        let releaseDate: String?
        let otherLabel: String?
    
        static let demo = Header(name: "Bloodborne", rating: "92", releaseDate: "2012/10/6", otherLabel: "From Software")
    }
    
    let header: Header
    let genres : [String]?
    let tags : [String]?
    let images: [String]?
    let description: String?

    
    static let demo = GameListingEntity(header: .demo, genres: ["Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch", "Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch"],tags:["Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch", "Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch"], images: ["placeholder_game_image", "placeholder_game_image", "placeholder_game_image", "placeholder_game_image"], description: "")
    
    static func map(model: Game) -> GameListingEntity {
        return GameListingEntity.init(header: .init(name: model.name,
                                                    rating: String(model.metacritic ?? 0),
                                                    releaseDate: model.released,
                                                    otherLabel: model.developers?[0].name ?? model.slug),
                                      genres: model.genres?.map({$0.name ?? ""}),
                                      tags: model.tags?.map({$0.name ?? ""}),
                                      images: model.shortScreenshots?.map({$0.image ?? ""}),
                                      description: model.descriptionRaw)
    }
    
    static func map(model: Game, screenShots: [String]?) -> GameListingEntity {
        return GameListingEntity.init(header: .init(name: model.name,
                                                    rating: String(model.metacritic ?? 0),
                                                    releaseDate: model.released,
                                                    otherLabel: model.developers?[0].name ?? model.slug),
                                      genres: model.genres?.map({$0.name ?? ""}),
                                      tags: model.tags?.map({$0.name ?? ""}),
                                      images: screenShots,
                                      description: model.descriptionRaw)
    }
}
