//
//  ContentView.swift
//  SwiftUI State
//
//  Created by sherry on 07/04/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentVM: ContentViewModel
    // @ObservedObject var contentVM = ContentViewModel()
    @State private var showForm = false
    var body: some View {
        VStack{
            List(contentVM.names, id: \.self) { name in Text(name)
                
            }
            .padding(.top,60)
            .frame(height: 400)
            
            Button(action: {
                    contentVM.name = ""
                    self.showForm = true}, label: {
                Text("Add Name")
            })
        }
        .sheet(isPresented: $showForm) {
          //  AddNameView(contentVM: contentVM, showForm: $showForm)
           AddNameView(showForm: $showForm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
