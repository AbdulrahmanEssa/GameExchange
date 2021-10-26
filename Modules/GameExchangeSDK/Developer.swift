//
//  GameDetails.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 16/08/2021.
//

import Foundation
import NetworkService


public class Developer : Codable {
    public var gamesCount: Int?
    public var id: Int?
    public var imageBackground: String?
    public var name: String?
    public var slug: String?
    public var domain: String?

    public init(gamesCount: Int?, id: Int?, imageBackground: String?, name: String?, slug: String?, domain: String?) {
        self.gamesCount = gamesCount
        self.id = id
        self.imageBackground = imageBackground
        self.name = name
        self.slug = slug
        self.domain = domain
    }
    
    public static func list(page: Int, success: @escaping Success<DeveloperList>, failure: @escaping Failure) {
        Router.developer.list(page: page).request(success: success, failure: failure)
    }
}
