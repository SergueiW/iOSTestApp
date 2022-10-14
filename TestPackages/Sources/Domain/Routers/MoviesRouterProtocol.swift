//
//  File.swift
//  
//
//  Created by Serguei Diaz on 14/10/22.
//

import Foundation
import SwiftUI

public protocol MoviesRouterProtocol {
            
    func openMoviesDetail<Content: View>(
        data: Movie,
        @ViewBuilder content: () -> Content
      ) -> AnyView
}
