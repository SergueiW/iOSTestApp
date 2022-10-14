//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Combine

public protocol MoviesRepository {
    init()
    
    func getMovies(page: Int) -> AnyPublisher<MoviesPage, Error>
    
}
