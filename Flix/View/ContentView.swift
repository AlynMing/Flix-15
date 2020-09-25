//
//  ContentView.swift
//  Flix
//
//  Created by Zhe Liu on 9/19/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MoviesViewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.self) { movie in
                HStack {
                    KFImage(movie.posterURL)
                        .resizable()
                        .aspectRatio(0.67, contentMode: .fill)
                        .frame(width: 80, height: 120)
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 3)
                        Text(movie.overview)
                            .font(.body)
                            .lineLimit(3)
                            .padding(.top, 3)
                    }
                }
            }.onAppear() {
                self.viewModel.fetchMovies()
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
