//
//  Movie.swift
//  Flix
//
//  Created by Zhe Liu on 9/21/20.
//

import Foundation

struct Movie: Decodable, Hashable {
    let title: String
    let poster_path: String
    let overview: String
}

struct MovieResults: Decodable {
    let results: [Movie]
}

extension Movie {
    var posterURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = "/t/p/w300" + poster_path
        return components.url!
    }
}
