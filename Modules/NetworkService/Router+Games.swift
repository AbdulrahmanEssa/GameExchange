//
//  Router+Games.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public extension Router {
    
    enum game : RAWGEndpoint {
        
        case list(page: Int)
        
        public var API_KEY: String {
            return "c52b8aabe474407db4a1cf013d0de8c5"
        }
        
        
        public var method: HTTPMethod {
            switch self {
                case .list:
                    return .get
                    
            }
        }
        
        public var path: String {
            switch self {
                case .list(let page):
                    return "/games"

            }
        }
        
        public var parameters: [String : String]? {
            switch self{
                case .list:
                    return nil
            }
        }
        
        public var body: Data? {
            return nil
        }
        
        public var query: [String : String]? {
            switch self {
                case .list(let page):
                    return ["page" : String(page), "key": "c52b8aabe474407db4a1cf013d0de8c5"]
            }
        }
    }
}
