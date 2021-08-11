//
//  FilterYear.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 11/08/2021.
//

import Foundation

public class FilterYear : Codable {
    public var count : Int?
    public var decade : Int?
    public var filter : String?
    public var from : Int?
    public var nofollow : Bool?
    public var to : Int?
    public var years : [Year]?
    
    public init(count: Int? = nil, decade: Int? = nil, filter: String? = nil, from: Int? = nil, nofollow: Bool? = nil, to: Int? = nil, years: [Year]? = nil) {
        self.count = count
        self.decade = decade
        self.filter = filter
        self.from = from
        self.nofollow = nofollow
        self.to = to
        self.years = years
    }
}
