//
//  SuperheroMoviesViewModel.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import Foundation
import Combine

final class SuperheroMoviesViewModel: ObservableObject {
    
    let title: String = "Superhero"
    
    @Published private(set) var movies: [Movie] = [Movie]()
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = MovieService().fetchSuperHeroMovies()
                        .sink(receiveCompletion: { _ in
                            
                        }, receiveValue: { [weak self] movieResults in
                            guard let self = self else { return }
                            self.movies = movieResults.results
                        })
    }
    
}
