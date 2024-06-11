//
//  Endpoint.swift
//  NetworkService
//
//  Created by Abdulrahman Essa on 09/08/2021.
//

import Foundation

public protocol Endpoint {
    var url: String {get}
    var parameters: [String: Any]? {get}
    var body : Data? {get}
    var method: HTTPMethod { get}
    var headers: [String: String]? {get}
    var query: [String : String]? {get}
}

extension Endpoint {
    public func request<T: Decodable>(success: @escaping Success<T>, failure: @escaping Failure)
    {
        var queryItems : [URLQueryItem] = []
        
        if (query != nil)
        {
            for (key, value) in self.query!
            {
                queryItems += [URLQueryItem(name: key, value: value)]
            }
        }
        var components = URLComponents(string: url)
        components?.queryItems = queryItems
        
        let url = components?.url
        
        var request = URLRequest(url: url!,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 120.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if (parameters != nil)
        {
            request.httpBody = parameters!.percentEncoded()
        }
        
//        print(request.url)

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                return failure(error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {return}
            let statusCode = httpResponse.statusCode
            guard statusCode > 199 && statusCode < 400 else {return print(statusCode)}
            guard let data = data else {return}
            
            let decoder = JSONDecoder();
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do
            {
                let object = try decoder.decode(T.self, from: data)
                success(object)
            }
            catch
            {
                print("You are gay")
                print(error)
                failure(error)
            }
        })
        dataTask.resume()
    }
}
