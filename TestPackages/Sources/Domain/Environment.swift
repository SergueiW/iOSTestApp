//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation

public struct Environment{
    public static let baseURL: String = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Info", ofType: "plist") ?? "")?.object(forKey: "BASE_URL") as? String ?? ""
    public static let token: String = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Info", ofType: "plist") ?? "")?.object(forKey: "TOKEN") as? String ?? ""
}
