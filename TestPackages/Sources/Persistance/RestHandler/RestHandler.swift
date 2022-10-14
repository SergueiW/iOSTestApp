//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine
import Helpers

public struct RestHandler {
            
    private var scheme: Scheme = .https
    
    private var httpMethod: HTTPMethod = .get
    
    private var host: String = ""
    
    private var path: String = ""
    
    private var authorization: String = ""
    
    private var query: [String : [String]] = [:]
    
    private var body: [String : Any] = [:]
    
    public init(){}
    
    public init(_ restHandler: RestHandler) {
        self.scheme = restHandler.scheme
        self.httpMethod = restHandler.httpMethod
        self.host = restHandler.host
        self.path = restHandler.path
        self.authorization = restHandler.authorization
        self.query = restHandler.query
    }
    
    public func scheme(_ scheme: Scheme) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.scheme = scheme
        
        return restHandler
    }
    
    public func host(_ host: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.host = host
        
        return restHandler
    }
    
    public func path(_ path: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.path = path
        
        return restHandler
    }
    
    public func authorization(_ auth: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.authorization = auth
        
        return restHandler
    }
    
    public func addQuery(_ query: [String : [String]]) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        query.keys.forEach { key in
            if let value = query[key] {
                restHandler.query[key] = value
            }
        }
        
        return restHandler
    }
    
    public func addQuery(_ query: [String : String]) -> RestHandler {
        
        var restHandler = RestHandler(self)

        query.keys.forEach { key in
            if let value = query[key] {
                var valueArray: [String] = []
                valueArray.append(value)
                restHandler.query[key] = valueArray
            }
        }
        
        return restHandler
    }
    
    public func addBody(_ body: [String : Any]) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.body = body
        
        return restHandler
    }
    
    public func execute<T: Decodable>(_ httpMethod: HTTPMethod, decoding: T.Type, decoder: JSONDecoder = JSONDecoder(), timeoutInterval: Double = 20) -> AnyPublisher<T, Error> {
        var urlComponents = URLComponents()
                
        urlComponents.scheme = self.scheme.rawValue
        
        urlComponents.host = self.host
        
        urlComponents.path = self.path
        
        urlComponents.queryItems = generateQuery(self.query)
                
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        guard let url = urlComponents.url
        else {
            fatalError("\(Self.self): Cannot build a URLRequest with an ill defined base url.")
        }
        
        var urlRequest = URLRequest(url: url, timeoutInterval: timeoutInterval)
        
        urlRequest.httpMethod = httpMethod.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
                
        urlRequest.setValue(self.authorization, forHTTPHeaderField: "Authorization")
        
        if !self.body.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: self.body, options: [])
        }
                
        return URLSession(configuration: .default)
            .dataTaskPublisher(for: urlRequest)
            .validate { data, response in
                guard let response = response as? HTTPURLResponse else { throw PredefinedError.invalidHTTPResponse }
                printDebugInfo(from: data, request: urlRequest, response: response)
            }
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
