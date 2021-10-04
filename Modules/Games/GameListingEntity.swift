//
//  GameListingEntity.swift
//  Games
//
//  Created by Abdulrahman Essa on 03/10/2021.
//

import Foundation
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
    let images: [String]?
    
    static let demo = GameListingEntity(header: .demo, genres: ["Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch", "Action", "RPG", "Horror", "Hack N Slash", "Souls-Like", "Eldritch"], images: ["placeholder_game_image", "placeholder_game_image", "placeholder_game_image", "placeholder_game_image"])
}
