//
//  RemindersListVCi.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import Foundation
import Combine
import Factory

class RemindersListViewModel: ObservableObject {
    @Published var reminders = [Reminder]()
    @Published var errorMessage: String?
    
    @Injected(\.remindersRepository)
    private var remindersRepository: ReminderRepository
    
    init() {
        remindersRepository
            .$reminders
            .assign(to: &$reminders)
    }
    
    func addReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.addReminder(reminder)
            errorMessage = nil
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func updateReminder(_ reminder: Reminder) {
        do {
           try remindersRepository.updateReminder(reminder)
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func setCompleted(_ reminder: Reminder, isCompleted: Bool) {
        var editedReminder = reminder
        editedReminder.isCompleted = isCompleted
        updateReminder(editedReminder)
    }
    
    func deleteReminder(_ reminder: Reminder) {
        remindersRepository.removeReminder(reminder)
    }
}
