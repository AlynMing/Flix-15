//
//  MovieDetailView.swift
//  Flix
//
//  Created by Lillian Chen on 9/28/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    KFImage(movie.backdropURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width , height: geometry.size.height / 2.0)
                    MovieInfoView(movie: movie)
                        .offset(y: -moviePosterHeight / 2.0)
                }
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(movie.title)
    }
    
    private let moviePosterHeight: CGFloat = 140.0
}

struct MovieInfoView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: contentSpacing) {
                KFImage(movie.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: moviePosterWidth, height: moviePosterHeight)
                    .padding(.leading, contentSpacing)
                VStack(alignment: .leading, spacing: 0) {
                    Text(movie.title)
                        .font(.system(size: movieTitleFontSize))
                        .bold()
                        .padding(.bottom, 6)
                    Text(movie.release_date)
                        .font(.system(size: movieReleaseDateFontSize))
                        .padding(0)
                }
                .offset(y: movieTitleFontSize + 10)
                .foregroundColor(.white)
                Spacer()
            }
            Text(movie.overview)
                .font(.system(size: movieOverviewFontSize))
                .foregroundColor(.white)
                .padding([.leading, .trailing], contentSpacing)
        }
    }
    
    private let contentSpacing: CGFloat = 16.0
    private let movieTitleFontSize: CGFloat = 16.0
    private let movieReleaseDateFontSize: CGFloat = 12.0
    private let movieOverviewFontSize: CGFloat = 16.0
    private let moviePosterWidth: CGFloat = 90.0
    private let moviePosterHeight: CGFloat = 140.0
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(title: "Ava",
                                     poster_path: "qzA87Wf4jo1h8JMk9GilyIYvwsA.jpg",
                                     overview: "A black ops assassin is forced to fight for her own survival after a job goes dangerously wrong.",
                                     backdrop_path: "qzA87Wf4jo1h8JMk9GilyIYvwsA.jpg",
                                     release_date: "2020-08-06"))
    }
}
