//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Domain

struct MovieMapper: MapperProtocol {
    let poster_path: String?
    let overview: String?
    let release_date: String?
    let title: String?
    let id: Int
    
    typealias T = Movie
    
    func execute() -> T {
        T(
            poster: URL(string: "https://image.tmdb.org/t/p/w500\(self.poster_path ?? "")"),
            overview: self.overview ?? "",
            release: self.release_date ?? "",
            title: self.title ?? "",
            id: "\(id)"
        )
    }
}
