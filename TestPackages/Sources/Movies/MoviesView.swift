//
//  File.swift
//  
//
//  Created by Serguei Diaz on 13/10/22.
//

import Foundation
import SwiftUI
import Kingfisher
import Domain

public struct MoviesView: View {
    
    @StateObject var presenter = MoviesPresenter()
    
    let router: MoviesRouterProtocol = MoviesRouter()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    public init(){}
    
    public var body: some View {
        ScrollView {
            if presenter.moviesAreLoading {
                
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(10)
                
            }
            else {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(presenter.movies, id: \.self) { item in
                        router.openMoviesDetail(data: item) {
                            KFImage(item.poster)
                                .placeholder({ _ in
                                    Color.black.opacity(0.25)
                                        .overlay {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        }
                                })
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                                .padding(10)
                        }
                        .onAppear {
                            if item.id == presenter.movies.last?.id {
                                presenter.getNextPage()
                            }
                        }
                    }
                }
            }
            
            if presenter.nextPageIsLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(10)
            }
        }
        .onAppear {
            self.presenter.getMovies()
        }
    }
}

