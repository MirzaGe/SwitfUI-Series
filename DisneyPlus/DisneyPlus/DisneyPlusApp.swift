//
//  DisneyPlusApp.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

@main
struct DisneyPlusApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(HomeViewModel())
    }
  }
}
