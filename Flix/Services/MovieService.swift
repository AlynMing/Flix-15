//
//  MovieService.swift
//  Flix
//
//  Created by Lillian Chen on 9/21/20.
//

import Foundation
import Combine

struct MovieService {
    private let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    private var moviesURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/now_playing"
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        return components.url!
    }
    
    private var superheroMovieURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/297762/similar"
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        return components.url!
    }
    
    func fetchMovies() -> AnyPublisher<MovieResults, Error> {
        return movieRequestion(for: moviesURL)
    }
    
    func fetchSuperHeroMovies() -> AnyPublisher<MovieResults, Error> {
        return movieRequestion(for: superheroMovieURL)
    }
    
    private func movieRequestion(for url: URL) -> AnyPublisher<MovieResults, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: MovieResults.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
}
