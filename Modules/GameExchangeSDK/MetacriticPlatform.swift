//
//  MetacriticPlatform.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 17/08/2021.
//

import Foundation

public class MetacriticPlatform : Codable {
    public var metascore: Int?
    public var platform: Platform?
    public var url: String?

    public init(metascore: Int?, platform: Platform?, url: String?) {
        self.metascore = metascore
        self.platform = platform
        self.url = url
    }
}
