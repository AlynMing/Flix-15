//
//  MoviesViewModel.swift
//  Flix
//
//  Created by Zhe Liu on 9/21/20.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    private let movieService: MovieService = MovieService()
    
    @Published private(set) var movies: [Movie] = [Movie]()
    
    private var cancellable: AnyCancellable?
    
    func fetchMovies() {
        cancellable = movieService.fetchMovies()
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { movieResults in
                self.movies = movieResults.results
            })
    }
    
}
