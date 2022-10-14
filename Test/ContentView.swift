//
//  ContentView.swift
//  Test
//
//  Created by Serguei Diaz on 13/10/22.
//

import SwiftUI
import Movies
import Table

struct ContentView: View {
    var body: some View {
        NavigationView {
            MoviesView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
