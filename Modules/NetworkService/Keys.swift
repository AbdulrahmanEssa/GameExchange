//
//  Keys.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 07/10/2021.
//

import Foundation

class Keys {
    static let rawg : ServiceKeys = .init(API_KEY: "c52b8aabe474407db4a1cf013d0de8c5", BASE_URL: "https://api.rawg.io/api")
}


struct ServiceKeys {
    let API_KEY : String
    let BASE_URL : String
}
