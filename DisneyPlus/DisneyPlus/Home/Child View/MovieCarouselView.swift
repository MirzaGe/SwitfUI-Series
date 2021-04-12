//
//  MovieCarouselView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//


import SwiftUI

struct MovieCarouselView: View {
  var movies = [Movie]()
  
  @State private var _currentIndex = 0
  @Binding var selectedMovie: Movie?
  @Binding var showDetail: Bool
  
  var body: some View {
    VStack(spacing: 10) {
      TabView(selection: $_currentIndex.animation()) {
        ForEach(0 ..< movies.count, id: \.self) { index in
          movies[index].posterImage?
            .resizable()
            .aspectRatio(1.7, contentMode: .fill)
            .onTapGesture {
              selectedMovie = movies[index]
              showDetail = true
            }
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      .frame(height: 225)
      
      HStack {
        ForEach(0 ..< movies.count, id: \.self) { index in
          Circle()
            .fill(index == _currentIndex ? Color.white : Color.white.opacity(0.3))
            .frame(width: 5, height: 5)
            .scaleEffect(index == _currentIndex ? 1.5 : 1)
        }
      }
    }
  }
}

struct MovieCarouselView_Previews: PreviewProvider {
  static var previews: some View {
    MovieCarouselView(movies: [Movie(title: "Mulan", titleLogo: nil, posterImage: Image("pg-mulan"), detailImage: nil),
                               Movie(title: "Animal Kingdom", titleLogo: nil, posterImage: Image("pg-animalKingdom"), detailImage: nil)],
                      selectedMovie: .constant(Movie(title: "Mandalorian", titleLogo: nil, posterImage: nil, detailImage: nil)),
                      showDetail: .constant(false))
  }
}

