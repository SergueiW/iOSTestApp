//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import Domain
import Resolver
import Combine

class MoviesPresenter: ObservableObject {
    
    @Injected public var moviesInteractor: MoviesUseCases

    @Published var movies: [Movie] = []
    
    @Published var moviesAreLoading: Bool = false
    
    @Published var nextPageIsLoading: Bool = false
    
    private var totalPages: Int = 1
    
    private var page: Int = 2
    
    private var subscriptions = Set<AnyCancellable>()
    
    public func getMovies() {
        if movies.isEmpty {
            self.moviesAreLoading = true
            moviesInteractor.getMovies()
                .receive(on: RunLoop.main)
                .sink { completion in
                    print(completion)
                    self.moviesAreLoading = false
                } receiveValue: { result in
                    self.movies = result.movies
                    self.totalPages = result.totalPages
                }
                .store(in: &subscriptions)
        }
    }
    
    public func getNextPage() {
        if page <= totalPages {
            self.nextPageIsLoading = true
            moviesInteractor.getNextPage(page: page)
                .receive(on: RunLoop.main)
                .sink { completion in
                    print(completion)
                    self.nextPageIsLoading = false
                } receiveValue: { result in
                    self.movies.append(contentsOf: result)
                    self.page = self.page + 1
                }
                .store(in: &subscriptions)
        }
        
    }
    
}
