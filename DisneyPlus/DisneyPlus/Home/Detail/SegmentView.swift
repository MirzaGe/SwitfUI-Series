//
//  SegmentView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

enum SegmentInfo: Int, CaseIterable {
  case suggested = 0
  case extras
  case details

  var view: some View {
    VStack {
      switch self  {
      case .suggested:
        SegmentSuggested()
      case .extras:
        SegmentExtras()
      case .details:
        SegmentDetails()
      }
    }
  }
}

struct SegmentView: View {
  @State private var segmentSelection = SegmentInfo.suggested

  var body: some View {
    Picker(selection: $segmentSelection, label: Text(""), content: {
      Text("Suggested").tag(SegmentInfo.suggested)
      Text("Extras").tag(SegmentInfo.extras)
      Text("Details").tag(SegmentInfo.details)
    })
    .pickerStyle(SegmentedPickerStyle())

    segmentSelection.view
  }
}

struct SegmentView_Previews: PreviewProvider {
  static var previews: some View {
    SegmentView()
  }
}
