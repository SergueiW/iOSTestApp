//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation

public struct MoviesPage: Hashable {
    public let page: Int
    public let movies: [Movie]
    public let totalMovies: Int
    public let totalPages: Int
    
    public init(
        page: Int,
        movies: [Movie],
        totalMovies: Int,
        totalPages: Int
    ) {
        self.page = page
        self.movies = movies
        self.totalMovies = totalMovies
        self.totalPages = totalPages
    }
}
