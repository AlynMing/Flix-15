//
//  ContentView.swift
//  Flix
//
//  Created by Lillian Chen on 9/19/20.
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
                        .aspectRatio(moviePosterAspectRatio, contentMode: .fill)
                        .frame(width: moviePosterWidth, height: moviePosterHeight)
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, textPadding)
                        Text(movie.overview)
                            .font(.body)
                            .lineLimit(lineLimit)
                            .padding(.top, textPadding)
                    }
                }
            }.onAppear() {
                self.viewModel.fetchMovies()
            }
            .navigationBarTitle("Movies", displayMode: .inline)
        }
    }
    
    private let moviePosterAspectRatio: CGFloat = 0.67
    private let moviePosterWidth: CGFloat = 80.0
    private let moviePosterHeight: CGFloat = 120.0
    private let textPadding: CGFloat = 3.0
    private let lineLimit: Int = 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
