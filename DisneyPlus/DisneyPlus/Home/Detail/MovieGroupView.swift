//
//  MovieGroupView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}

struct MovieGroupView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  
  var movieGroup: MovieGroup
  @State private var _logoOpacity: CGFloat = 0
  @State private var _bgOpacity: CGFloat = 0
  
  var body: some View {
    ZStack {
      VStack {
        Image("bg-\(movieGroup.rawValue)")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .opacity(Double(_bgOpacity))
        
        Rectangle()
          .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
          .frame(height: 50)
          .offset(y: -55)
        
        Spacer()
      }
      .edgesIgnoringSafeArea(.all)
      
      Text("")
        .toolbar {
          ToolbarItem(placement: .principal) {
            Image("logo-\(movieGroup.rawValue)")
              .resizable()
              .aspectRatio(2.8, contentMode: .fit)
              .frame(height: 25)
              .opacity(1 - Double(_logoOpacity))
          }
        }
      
      ScrollView(showsIndicators: false) {
        VStack(alignment: .center, spacing: 10) {
          Image("logo-\(movieGroup.rawValue)")
            .resizable()
            .aspectRatio(2.8, contentMode: .fit)
            .frame(height: 75)
            .padding(.top, 130)
            .padding(.bottom, 20)
            .opacity(Double(_logoOpacity))
          
          HorizontalList(group: .recommendation)
          HorizontalList(group: .recommendation)
          HorizontalList(group: .recommendation)
          HorizontalList(group: .recommendation)
          HorizontalList(group: .recommendation)
          
          Spacer()
        }
        
        GeometryReader { geometry in
          let offset = geometry.frame(in: .named("scrollView")).maxY
          Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
        }
      }
      .coordinateSpace(name: "scrollView")
      .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { offSetValue in
        if ScrollViewOffsetPreferenceKey.defaultValue == 0 {
          ScrollViewOffsetPreferenceKey.defaultValue = offSetValue
        }
        
        let logoHeightToFade: CGFloat = 50
        self._logoOpacity = (logoHeightToFade - max((ScrollViewOffsetPreferenceKey.defaultValue - offSetValue), 0)) / logoHeightToFade
        
        let bgHeightToFade: CGFloat = 275
        self._bgOpacity = (bgHeightToFade - max((ScrollViewOffsetPreferenceKey.defaultValue - offSetValue), 0)) / bgHeightToFade
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
                          Button(action: { mode.wrappedValue.dismiss() },
                                 label: {
                                  Image(systemName: "arrowtriangle.backward.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                 })
                          .frame(width: 24, height: 24))
  }
}

struct MovieGroupView_Previews: PreviewProvider {
  static var previews: some View {
    MovieGroupView(movieGroup: .marvel)
  }
}
