//
//  RawgEndpoint.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public protocol RAWGEndpoint : Endpoint {
    
    var path: String {get}
    var parameters: [String : Any]? {get}
    var body: Data? {get}
    var method: HTTPMethod {get}
    var query: [String : String]? {get}
    var additionalQuery: [String : String] {get}

}

public extension RAWGEndpoint {
    
    var url: String {
        var u : String
        if (path.contains("http"))
        {
            u = path;
        }
        else
        {
            u = Keys.rawg.BASE_URL + path
        }
        return u
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var query : [String : String]? {
        var q = additionalQuery
        q["key"] = apiKey
        return q
    }
    
    var apiKey : String {
        return Keys.rawg.API_KEY
    }
    
}
