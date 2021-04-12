//
//  SquareButtonStyle.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct SquareButtonStyle: ButtonStyle {
  let size: CGFloat
  
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .frame(width: size, height: size)
      .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7),
                                                             Color.blue.opacity(0.4)]),
                                 startPoint: .top,
                                 endPoint: .bottom))
      .cornerRadius(8)
      .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 0.25))
  }
}

