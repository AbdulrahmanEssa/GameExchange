//
//  Requirements.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 17/08/2021.
//

import Foundation

public class Requirements : Codable {
    public var minimum: String?
    public var recommended: String?

    public init(minimum: String?, recommended: String?) {
        self.minimum = minimum
        self.recommended = recommended
    }
}
