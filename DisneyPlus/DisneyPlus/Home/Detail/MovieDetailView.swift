//
//  MovieDetailView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct MovieDetailView: View {
  @Binding var movie: Movie?

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading, spacing: 20) {
        Image("detail-\(movie?.title.lowercased() ?? "")")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 240)

        VStack(alignment: .leading, spacing: 30) {
          Image("title-logo-\(movie?.title.lowercased() ?? "")")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200)

          HStack(spacing:0) {
            Button(action: {}, label: {
              HStack {
                Image(systemName: "play.fill")
                Text("RESUME")
                  .kerning(2)
              }
            })
            .font(.footnote)
            .background(Rectangle()
                          .fill(Color.white).frame(width: 110, height: 30)
                          .cornerRadius(4))
            .foregroundColor(Color.black.opacity(0.8))
            .offset(x: 10)
            .padding(.trailing, 20)

            CircleButtonImage(size: 30, action: {}, content: {
              image(name: "plus")
            })

            CircleButtonImage(size: 30, action: {}, content: {
              image(name: "square.and.arrow.up")
            })
          }

          Text("""
          A Mandalorian bounty hunter tracks a target for a well-paying, mysterious client.
          """)
            .font(.footnote)

          SegmentView()
        }
        .padding(.horizontal, 40)
      }
    }
  }

  private func image(name: String) -> some View {
    return Image(systemName: name)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 13)
  }
}

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailView(movie: .constant(Movie(title: "Mandalorian", titleLogo: Image("title-logo-mandalorian"), posterImage: Image("pg-mandalorian"), detailImage: Image("detail-mandalorian"))))
  }
}
