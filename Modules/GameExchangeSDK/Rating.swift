//
//  Rating.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class Rating : Codable {
    public var id : Int?
    public var count : Int?
    public var percent : Double?
    public var title : String?
    
    public init(id: Int? = nil, count: Int? = nil, percent: Double? = nil, title: String? = nil) {
        self.id = id
        self.count = count
        self.percent = percent
        self.title = title
    }
}
