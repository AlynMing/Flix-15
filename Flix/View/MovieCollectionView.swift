//
//  MovieCollectionView.swift
//  Flix
//
//  Created by Zhe Liu on 9/30/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieCollectionView: View {
    
    @StateObject private var superheroMovieViewModel: SuperheroMoviesViewModel = SuperheroMoviesViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: itemSpacing), GridItem(.flexible())], spacing: itemSpacing) {
                    ForEach(superheroMovieViewModel.movies, id:\.self) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            KFImage(movie.posterURL)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle(superheroMovieViewModel.title, displayMode: .inline)
    }
    
    private let itemSpacing: CGFloat = 3.0
}

struct MovieCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCollectionView()
    }
}
