//
//  HomeViewModel.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

enum ListGroup {
  case recommendation
  case new
  
  var list: [Image] {
    switch self {
    case .recommendation:
      return HomeViewModel().recommendations
      
    case .new:
      return HomeViewModel().newPosters
    }
  }
  
  var title: String {
    switch self {
    case .recommendation:
      return "Recommended For You"
    
    case .new:
      return "New to Disney+"
    }
  }
}

enum MovieGroup: String {
  case disney
  case pixar
  case marvel
  case starWars
  case natgeo
}

class HomeViewModel: ObservableObject, Identifiable {
  @Published var pageViews = [Movie]()
  @Published var newPosters = [Image]()
  @Published var recommendations = [Image]()
  
  init() {
    setupPageViews()
    setupRecommendations()
    setupNewMovies()
  }
  
  private func setupPageViews() {
    self.pageViews = [
      Movie(title: "Mandalorian", titleLogo: Image("title-logo-mandalorian"), posterImage: Image("pg-mandalorian"), detailImage: Image("detail-mandalorian")),
      Movie(title: "Sorcerer Apprentice", titleLogo: nil, posterImage: Image("pg-sorcererApprentice"), detailImage: nil),
      Movie(title: "Mulan", titleLogo: nil, posterImage: Image("pg-mulan"), detailImage: nil),
      Movie(title: "Animal Kingdom", titleLogo: nil, posterImage: Image("pg-animalKingdom"), detailImage: nil)
    ]
  }
  
  private func setupRecommendations() {
    recommendations = [
      Image("poster-avengers"),
      Image("poster-sorcerer"),
      Image("poster-moana"),
      Image("poster-solo"),
      Image("poster-hocusPocus")
    ]
  }
  
  private func setupNewMovies() {
    newPosters = [
      Image("poster-mandalorian"),
      Image("poster-snowman"),
      Image("poster-sorcerer"),
      Image("poster-animalKingdom"),
      Image("poster-toyStory")
    ]
  }
}
