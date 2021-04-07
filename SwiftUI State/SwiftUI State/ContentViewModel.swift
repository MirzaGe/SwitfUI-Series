//
//  ContentViewModel.swift
//  SwiftUI State
//
//  Created by sherry on 07/04/2021.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var names = ["Bob", "Susan"]
    
    var name: String = ""
    
    func save() {
        names.append(name)
    }
}

