//
//  MovieService.swift
//  Flix
//
//  Created by Zhe Liu on 9/21/20.
//

import Foundation
import Combine

struct MovieService {
    let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    var moviesURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/now_playing"
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        return components.url!
    }
    
    func fetchMovies() -> AnyPublisher<MovieResults, Error> {
        return URLSession.shared.dataTaskPublisher(for: moviesURL)
                    .map { $0.data }
                    .decode(type: MovieResults.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
}
