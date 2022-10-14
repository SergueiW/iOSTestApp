//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine
import Domain

public struct MoviesRestRepository: MoviesRepository {
    
    public init(){}
    
    public func getMovies(page: Int) -> AnyPublisher<MoviesPage, Error> {
        RestHandler()
            .scheme(.https)
            .host(Environment.baseURL)
            .path("/3/movie/top_rated")
            .addQuery(["api_key" : Environment.token,
                       "page" : "\(page)"])
            .execute(.get, decoding: MoviesPageMapper.self)
            .tryMap { (response) -> MoviesPage in
                response.execute()
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
