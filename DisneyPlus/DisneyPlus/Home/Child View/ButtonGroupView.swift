//
//  ButtonGroupView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct ButtonGroupView: View {
  @State private var _groupName: String? = nil
  
  var body: some View {
    NavigationLink(
      destination: MovieGroupView(movieGroup: MovieGroup(rawValue: _groupName ?? "") ?? .disney),
      tag: _groupName ?? MovieGroup.disney.rawValue,
      selection: $_groupName) {
      EmptyView()
    }
    
    HStack {
      Button(action: { _groupName = MovieGroup.disney.rawValue }) {
        image(name: "logo-disney")
      }
      
      Button(action: { _groupName = MovieGroup.marvel.rawValue }) {
        image(name: "logo-marvel")
      }
      
      Button(action: { _groupName = MovieGroup.pixar.rawValue }) {
        image(name: "logo-pixar")
      }
      
      Button(action: { _groupName = MovieGroup.starWars.rawValue }) {
        image(name: "logo-starWars")
      }
      
      Button(action: { _groupName = MovieGroup.natgeo.rawValue }) {
        image(name: "logo-natgeo")
      }
    }
    .buttonStyle(SquareButtonStyle(size: UIScreen.main.bounds.width/6))
  }
  
  private func image(name: String) -> some View {
    return Image(name)
      .resizable()
      .aspectRatio(2.8, contentMode: .fit)
      .frame(height: 20)
  }
}

struct ButtonGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonGroupView()
  }
}
