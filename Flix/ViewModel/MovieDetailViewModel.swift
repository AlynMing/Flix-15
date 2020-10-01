//
//  MovieDetailViewModel.swift
//  Flix
//
//  Created by Zhe Liu on 9/30/20.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {
    
    @Published private(set) var movieTrailer: MovieTrailer?
    @Published private(set) var isLoading: Bool = false
    @Published var showingMovieTrailer: Bool = false
    @Published private(set) var movie: Movie
    
    private var cancellable: [AnyCancellable] = []
    private var movieService: MovieService
    
    init(with movie: Movie, movieService: MovieService = MovieService()) {
        self.movie = movie
        self.movieService = movieService
    }
    
    func getMovieTrailer() {
        isLoading = true
        if movieTrailer != nil {
            isLoading = false
            showingMovieTrailer = true
            return
        }
        movieService.fetchMovieTrailer(for: movie.id)
            .sink { _ in
                
            } receiveValue: { [weak self] movieTrailer in
                guard let self = self else { return }
                guard let movieTrailer = movieTrailer else { self.isLoading = false; return }
                self.movieTrailer = movieTrailer
                self.isLoading = false
                self.showingMovieTrailer = true
            }.store(in: &cancellable)
    }
    
    
}
