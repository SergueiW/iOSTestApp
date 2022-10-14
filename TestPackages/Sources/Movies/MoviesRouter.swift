//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import SwiftUI
import Domain

public struct MoviesRouter: MoviesRouterProtocol {
    
    public func openMoviesDetail<Content: View>(
        data: Movie,
        @ViewBuilder content: () -> Content
    ) -> AnyView {
        AnyView(
            NavigationLink {
                MoviesDetailView(data: data)
            } label: {
                content()
            }
        )
        
    }
    
}
