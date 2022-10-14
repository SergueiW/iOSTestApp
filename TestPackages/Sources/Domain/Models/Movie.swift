//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation

public struct Movie: Hashable {
    public let poster: URL?
    public let overview: String
    public let release: String
    public let title: String
    public let id: String
    
    public init(
        poster: URL?,
        overview: String,
        release: String,
        title: String,
        id: String
    ) {
        self.poster = poster
        self.overview = overview
        self.release = release
        self.title = title
        self.id = id
    }
}
