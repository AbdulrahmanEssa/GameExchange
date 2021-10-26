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
        case details(id: Int)
        
        public var method: HTTPMethod {
            switch self {
            case .list:
                return .get
            case .details:
                return .get
                    
            }
        }
        
        public var path: String {
            switch self {
            case .list:
                    return "/games"
            case .details(id: let id):
                return "/games/" + String(id)

            }
        }
        
        public var parameters: [String : Any]? {
            return nil
        }
        
        public var body: Data? {
            return nil
        }
        
        public var additionalQuery: [String : String] {
            switch self {
            case .list(page: let page):
                return ["page" : String(page)]
            case .details(id: _):
                return [:]
            }
        }
    }
}
