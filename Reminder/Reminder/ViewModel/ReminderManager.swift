//
//  ReminderManager.swift
//  Reminder
//
//  Created by sherry on 12/04/2021.
//

import Foundation

class ReminderManager: ObservableObject {
  static let shared = ReminderManager()
  
  @Published var reminders = [Reminder]()
  
  private init() {
    loadReminders()
  }
  
  private func loadReminders() {
    if let data = UserDefaults.standard.data(forKey: "reminders"),
       let reminders = try? JSONDecoder().decode([Reminder].self, from: data) {
      self.reminders = reminders
    }
  }
  
  func set(_ reminder: Reminder) {
    var reminders = self.reminders
    
    if !reminders.filter({ $0.id == reminder.id }).isEmpty {
      update(reminder)
    }
    else {
      reminders.append(reminder)
      save(reminders)
    }
  }
  
  func update(_ reminder: Reminder) {
    var reminders = self.reminders
    
    if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
      reminders[index] = reminder
    }
    
    save(reminders)
  }
  
  func delete(_ reminder: Reminder) {
    let reminders = self.reminders.filter({ $0.id != reminder.id })
    save(reminders)
  }
  
  func move(from source: IndexSet, to destination: Int) {
    var reminders = self.reminders
    reminders.move(fromOffsets: source, toOffset: destination)
    save(reminders)
  }
  
  func save(_ reminders: [Reminder]) {
    self.reminders = sort(reminders)
    
    let encodedData = try? JSONEncoder().encode(self.reminders)
    UserDefaults.standard.set(encodedData, forKey: "reminders")
  }
  
  func sort(_ reminders: [Reminder]) -> [Reminder] {
    return reminders
      .sorted(by: { !$0.completed && $1.completed })
  }
}
