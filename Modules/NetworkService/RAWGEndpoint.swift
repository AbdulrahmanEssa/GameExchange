//
//  RawgEndpoint.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public protocol RAWGEndpoint : Endpoint {
    
    var path: String {get}
    var parameters: [String : String]? {get}
    var body: Data? {get}
    var method: HTTPMethod {get}
    var query: [String : Any] {get}
    var API_KEY: String {get}

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
            u = "https://api.rawg.io/api" + path
        }
        return u
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var query : [String : Any] {
        return query
    }
    
    var API_Key : String {
        return "c52b8aabe474407db4a1cf013d0de8c5"
    }
    
}
