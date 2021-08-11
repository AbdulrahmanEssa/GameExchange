//
//  ShortScreenshot.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class ShortScreenshot : Codable {
    public var id : Int?
    public var image : String?
    
    public init(id: Int? = nil, image: String? = nil) {
        self.id = id
        self.image = image
    }
}
