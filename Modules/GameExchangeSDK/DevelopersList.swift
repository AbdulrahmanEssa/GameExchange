//
//  DevelopersList.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 07/10/2021.
//

import Foundation

public class DeveloperList : Codable {
    
    public var count :Int?
    public var next : String?
    public var previous : String?
    public var results : [Developer]?
    
    public init(count: Int? = nil, next: String? = nil, previous: String? = nil, results: [Developer]? = nil) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

