//
//  Reminder.swift
//  Reminder
//
//  Created by sherry on 07/04/2021.
//

import Foundation

struct Reminder: Identifiable {
    var id = UUID().uuidString
    var name : String
    var completed: Bool
}
    #if DEBUG
    let mockReminder = [
        Reminder(name:"Set appointment with Tim", completed: false),
        Reminder(name:"Pick up Groceries", completed: false),
        Reminder(name:"Dinner With Bob", completed: false),
        Reminder(name:"Search order That Gift", completed: false),
        Reminder(name:"Lets order new MacBook ", completed: false),
    ]
    #endif

