//
//  StoreListing.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class StoreListing : Codable {
    public var id : Int?
    public var store: Store?
    
    public init(id: Int? = nil, store: Store? = nil) {
        self.id = id
        self.store = store
    }
}
