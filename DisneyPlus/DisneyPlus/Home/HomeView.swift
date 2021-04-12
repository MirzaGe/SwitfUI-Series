//
//  HomeView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var homeVM: HomeViewModel
  @State private var showDetail: Bool = false
  @State private var selectedMovie: Movie?
  
  var body: some View {
    NavigationView {
      ZStack {
        Rectangle()
          .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.darkGray.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing))
          .edgesIgnoringSafeArea(.all)
        
        ScrollView(showsIndicators: false) {
          VStack(alignment: .center, spacing: 10) {
            Image("logo")
              .resizable()
              .frame(height: 40)
              .aspectRatio(1.7, contentMode: .fit)
            
            MovieCarouselView(movies: homeVM.pageViews, selectedMovie: $selectedMovie, showDetail: $showDetail)
            
            ButtonGroupView()
              .padding(.top, -15)
              .padding(.bottom, 15)
            
            HorizontalList(group: .recommendation)
            HorizontalList(group: .new)
            
            Spacer()
          }
        }
      }
      .sheet(isPresented: $showDetail) {
        MovieDetailView(movie: $selectedMovie)
      }
      .navigationBarHidden(true)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environment(\.colorScheme, .light)
      .environmentObject(HomeViewModel())
    
    HomeView()
      .environment(\.colorScheme, .dark)
      .environmentObject(HomeViewModel())
  }
}
