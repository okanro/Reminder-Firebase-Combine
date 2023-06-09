//
//  Reminder.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Reminder: Identifiable, Codable {
    @DocumentID
    var id: String?
    var title: String
    var isCompleted: Bool = false
}

extension Reminder {
    static let collectionName = "reminders"
}

extension Reminder {
    static let samples = [
        Reminder(title: "NewJob", isCompleted: false),
        Reminder(title: "Do I need this", isCompleted: false),
        Reminder(title: "Yesss", isCompleted: true),
        Reminder(title: "Susge??")
    ]
}
