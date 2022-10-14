//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine
import Domain
import Resolver

public struct MoviesInteractor: MoviesUseCases {
    @Injected public var repository: MoviesRepository
        
    public init(){}
    
    public func getMovies() -> AnyPublisher<MoviesPage, Error> {
        repository.getMovies(page: 1)
    }
    
    public func getNextPage(page: Int) -> AnyPublisher<[Movie], Error> {
        repository.getMovies(page: page)
            .tryMap { item in
                item.movies
            }
            .eraseToAnyPublisher()
    }
    
}
