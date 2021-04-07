//
//  AddNameView.swift
//  SwiftUI State
//
//  Created by sherry on 07/04/2021.
//

    import SwiftUI

    struct AddNameView: View {
        //@ObservedObject var contentVM: ContentViewModel
        @EnvironmentObject var contentVM: ContentViewModel
        @Binding var showForm : Bool
        
        var body: some View {
            TextField("Enter New Name", text: $contentVM.name,
                      onEditingChanged: { _ in },
                      onCommit: {
                        contentVM.save()
                        showForm = false
                      })
                .padding()
        }
    }

    struct AddNameView_Previews: PreviewProvider {
       static var previews: some View {
            //AddNameView(contentVM: ContentViewModel(),
                       // showForm: .constant(true))
        AddNameView(showForm: .constant(true))
            .environmentObject(ContentViewModel())
        }
    }
