//
//  Movie.swift
//  Flix
//
//  Created by Lillian Chen on 9/21/20.
//

import Foundation

struct Movie: Decodable, Hashable {
    let title: String
    let poster_path: String
    let overview: String
    let backdrop_path: String
    let release_date: String
}

struct MovieResults: Decodable {
    let results: [Movie]
}

extension Movie {
    
    enum MovieImageType {
        case poster
        case backdrop
    }
    
    var posterURL: URL {
        imageURL(of: .poster)
    }
    
    var backdropURL: URL {
        imageURL(of: .backdrop)
    }
    
    private func imageURL(of type: MovieImageType) -> URL {
        var pathString = ""
        var imageWidth = ""
        switch type {
        case .poster:
            pathString = poster_path
            imageWidth = "300"
        case .backdrop:
            pathString = backdrop_path
            imageWidth = "500"
        }
        var components = URLComponents()
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = "/t/p/w" + imageWidth + pathString
        return components.url!
    }
}
