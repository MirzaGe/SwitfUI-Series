//
//  HorizontalList.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct HorizontalList: View {
  @EnvironmentObject var homeVM: HomeViewModel
  private let _group: ListGroup
  private var moviePosters = [Image]()
  
  init(group: ListGroup) {
    self._group = group
    self.moviePosters = group.list
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: -5) {
      Text(_group.title)
        .foregroundColor(.white)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 10) {
          ForEach(moviePosters, id: \.id) { image in
            image
              .resizable()
              .frame(width: 100, height: 140, alignment: .center)
              .aspectRatio(contentMode: .fill)
          }
        }
        .padding()
      }
      .frame(width: UIScreen.main.bounds.width, height: 160)
      .padding(.horizontal, -20)
    }
  }
}

struct HorizontalList_Previews: PreviewProvider {
  static var previews: some View {
    HorizontalList(group: .new)
      .environmentObject(HomeViewModel())
  }
}
