//
//  Reminder.swift
//  Reminder
//
//  Created by sherry on 07/04/2021.
//

import Foundation

struct Reminder: Identifiable, Codable, Equatable {
  var id = UUID().uuidString
  var name: String
  var completed: Bool
  
  static func new() -> Reminder {
    return Reminder(name: "", completed: false)
  }
}

#if DEBUG
  let mockReminder = [
    Reminder(name: "Set appointment with Tim", completed: false),
    Reminder(name: "Pick up groceries", completed: false),
    Reminder(name: "Dinner with Bob", completed: false),
    Reminder(name: "Search holiday gift", completed: false),
    Reminder(name: "Order the new Macbook", completed: false)
  ]
#endif
