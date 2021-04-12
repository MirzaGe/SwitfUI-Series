//
//  ContentView.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct MainView: View {
  @State private var _selection = 0
  
  init() {
    UITabBar.appearance().barTintColor = .black
    UITabBar.appearance().alpha = 0.97
  }
  
  var body: some View {
    TabView(selection: $_selection) {
      HomeView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
        .tag(0)
      
      Text("Tab Content 2")
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("Search")
        }
        .tag(1)
      
      Text("Tab Content 3")
        .tabItem {
          Image(systemName: "icloud.and.arrow.down")
          Text("Download")
        }
        .tag(2)
      
      Text("Tab Content 4")
        .tabItem {
          Image(systemName: "person.circle")
          Text("Account")
        }
        .tag(3)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(HomeViewModel())
  }
}
