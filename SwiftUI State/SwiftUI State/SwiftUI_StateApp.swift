//
//  SwiftUI_StateApp.swift
//  SwiftUI State
//
//  Created by sherry on 07/04/2021.
//

import SwiftUI

@main
struct SwiftUI_StateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel())
        }
    }
}
