//
//  Year.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 11/08/2021.
//

import Foundation

public class Year : Codable {
    public var count : Int?
    public var nofollow : Bool?
    public var year : Int?
    
    public init(count: Int? = nil, nofollow: Bool? = nil, year: Int? = nil) {
        self.count = count
        self.nofollow = nofollow
        self.year = year
    }
}
