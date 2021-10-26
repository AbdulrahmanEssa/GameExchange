//
//  Router+Developers.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 07/10/2021.
//

import Foundation
public extension Router {

    enum developer : RAWGEndpoint {

        case list(page: Int)

        public var method: HTTPMethod {
            switch self {
                case .list:
                    return .get

            }
        }

        public var path: String {
            switch self {
            case .list:
                    return "/developers"

            }
        }

        public var parameters: [String : Any]? {
            switch self{
                case .list:
                    return nil
            }
        }

        public var body: Data? {
            return nil
        }

        public var additionalQuery: [String : String] {
            switch self {
                case .list(let page):
                    return ["page" : String(page)]
            }
        }
    }
}
