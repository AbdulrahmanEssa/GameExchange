//
//  GameListFilters.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class GameListFilter : Codable {
    public var years : [FilterYear]?
    
    public init(years: [FilterYear]? = nil) {
        self.years = years
    }
}
