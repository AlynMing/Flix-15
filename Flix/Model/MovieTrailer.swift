//
//  MovieTrailer.swift
//  Flix
//
//  Created by Lillian Chen on 9/30/20.
//

import Foundation

struct MovieTrailerResult: Decodable {
    let results: [MovieTrailer]
}

struct MovieTrailer: Decodable {
    let key: String
}

extension MovieTrailer {
    var trailerURL: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.youtube.com"
        components.path = "/watch"
        components.queryItems = [URLQueryItem(name: "v", value: key)]
        return components.url!
    }
}
