//
//  Resolver.swift
//  Test
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Core
import Domain
import Resolver
import Persistance

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register {
            MoviesRestRepository()
        }
        .implements(MoviesRepository.self)
        
        register {
            MoviesInteractor()
        }
        .implements(MoviesUseCases.self)
        
    }
}
