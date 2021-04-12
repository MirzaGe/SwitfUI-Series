//
//  ReminderList.swift
//  Reminder
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

struct ReminderList: View {
  @ObservedObject var reminderManager = ReminderManager.shared
  @State private var hideCompleted = false
  @State private var addReminder = false
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 10) {
        List {
          Toggle("Hide completed", isOn: $hideCompleted)
          
          ForEach(reminderManager.reminders, id: \.id) { reminder in
            if !hideCompleted || !reminder.completed {
              ReminderCell(vm: ReminderCellViewModel(reminder: reminder))
            }
          }
          .onDelete(perform: self.removeRow)
          .onMove(perform: self.move)
          
          if addReminder {
            ReminderCell(vm: ReminderCellViewModel(reminder: Reminder.new()))
          }
        }
        .padding(.horizontal, -20)
        
        HStack {
          Button(action: { toggleAddForm() }) {
            if addReminder {
              Button(action: { self.toggleAddForm() }, label: {
                Text("Done")
              })
              .padding()
            }
            else {
              HStack {
                Image(systemName: "plus.circle.fill")
                  .resizable()
                  .frame(width: 25, height: 25, alignment: .center)
                
                Text("New Reminder")
              }
              .padding()
            }
            
            Spacer()
          }
        }
      }
      .navigationBarTitle("Reminder - \(reminderManager.reminders.filter { !$0.completed }.count) Item\(reminderManager.reminders.filter { !$0.completed }.count > 1 ? "s" : "")")
      .navigationBarItems(trailing: EditButton())
    }
  }
  
  private func toggleAddForm() {
    addReminder.toggle()
  }
  
  private func removeRow(at offsets: IndexSet) {
    for offset in offsets {
      let reminder = reminderManager.reminders[offset]
      reminderManager.delete(reminder)
    }
  }
  
  private func move(from source: IndexSet, to destination: Int) {
    reminderManager.move(from: source, to: destination)
  }
}

struct ReminderList_Previews: PreviewProvider {
  static var previews: some View {
    ReminderList()
  }
}
