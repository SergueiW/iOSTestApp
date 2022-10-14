//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation

extension RestHandler {
    public func generateQuery(_ queryArray: [String : [String]]) -> [URLQueryItem] {
        var query: [URLQueryItem] = []

        queryArray.keys.forEach { key in
            queryArray[key]?.forEach({ value in
                if value != "" {
                    query.append(URLQueryItem(name: key, value: value))
                }
            })
        }
        
        return query
    }
    
    public func printDebugInfo(from data: Data, request: URLRequest, response: HTTPURLResponse) {
        print("--------DEBUGGING--------")
        if let url = response.url {
            print("Path: \(url)")
        }
        
        print("Result: HTTP Status Code \(response.statusCode) \(StatusCode(rawValue: response.statusCode) ?? StatusCode.invalidData)")
        
        if let json = String(data: data, encoding: String.Encoding.utf8) {
            print("Response: \(json)")
        }
        
        print("--------------------------------")
    }
}
