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

struct MoviesDetailView: View {
    
    let data: Movie
    
    func infoRow(title: String, value: String) -> some View {
        HStack {
            Text("\(title): ")
                .fontWeight(.bold)
            
            Text(value)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Spacer()
        }
    }
        
    var body: some View {
        ScrollView{
            LazyVStack {
                KFImage(data.poster)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                
                VStack {
                    
                    infoRow(title: "Release", value: data.release)
                        .padding(.bottom, 10)
                    
                    Text(data.overview)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
        }
        .navigationTitle(data.title)
    }
}
