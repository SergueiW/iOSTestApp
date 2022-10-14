//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine

public protocol MoviesUseCases {
        
    func getMovies() -> AnyPublisher<MoviesPage, Error>
    
    func getNextPage(page: Int) -> AnyPublisher<[Movie], Error>
    
}
