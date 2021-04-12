//
//  CircleButtonImage.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct CircleButtonImage<Content: View>: View {
  let size: CGFloat
  let action: () -> Void
  let content: Content

  init(size: CGFloat,
       action: @escaping () -> Void,
       @ViewBuilder content: () -> Content) {
    self.size = size
    self.action = action
    self.content = content()
  }

  var body: some View {
    content
      .frame(width: size, height: size, alignment: .center)
      .overlay(Circle().strokeBorder(Color.white, lineWidth: 2))
      .padding(.leading, 10)
  }
}

