//
//  GameListResults.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class GameList : Codable {
    public var count : Int?
    public var next : String?
    public var previous : String?
    public var results : [Game]?
    public var description : String?
    public var filters : GameListFilter?
    public var nofollow : Bool?
    public var nofollowCollections : [String]?
    public var noindex : Bool?
    public var seoDescription : String?
    public var seoH1 : String?
    public var seoKeywords : String?
    public var seoTitle : String?
    
    public init(count: Int? = nil, next: String? = nil, previous: String? = nil, results: [Game]? = nil, description: String? = nil, filters: GameListFilter? = nil, nofollow: Bool? = nil, nofollowCollections: [String]? = nil, noindex: Bool? = nil, seoDescription: String? = nil, seoH1: String? = nil, seoKeywords: String? = nil, seoTitle: String? = nil) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
        self.description = description
        self.filters = filters
        self.nofollow = nofollow
        self.nofollowCollections = nofollowCollections
        self.noindex = noindex
        self.seoDescription = seoDescription
        self.seoH1 = seoH1
        self.seoKeywords = seoKeywords
        self.seoTitle = seoTitle
    }
}
