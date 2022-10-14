//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Domain

struct MoviesPageMapper: MapperProtocol {
    let page: Int
    let results: [MovieMapper]
    let total_results: Int
    let total_pages: Int
    
    typealias T = MoviesPage
    
    func execute() -> T {
        T(
            page: self.page,
            movies: self.results.map({ item in
                item.execute()
            }),
            totalMovies: self.total_results,
            totalPages: self.total_pages
        )
    }

}
