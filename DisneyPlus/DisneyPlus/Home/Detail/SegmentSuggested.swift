//
//  SegmentSuggested.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct SegmentSuggested: View {
  @EnvironmentObject var homeVM: HomeViewModel
  @State private var images = [Image]()

  let data = [
    Image("poster-avengers"),
    Image("poster-moana"),
    Image("poster-solo"),
    Image("poster-toyStory")
  ]

  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {
    LazyVGrid(columns: columns) {
      ForEach(0..<data.count, id: \.self) { idx in
        data[idx]
          .resizable()
          .aspectRatio(contentMode: .fill)
          .padding(5)
      }
    }
  }
}

struct SegmentSuggested_Previews: PreviewProvider {
  static var previews: some View {
    SegmentSuggested()
      .environmentObject(HomeViewModel())
  }
}
