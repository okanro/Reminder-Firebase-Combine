//
//  ReminderView.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import SwiftUI

struct EditReminderDetailsView: View {
    enum Mode {
        case add
        case edit
    }
    
    var mode: Mode = .add
    
    @Environment(\.dismiss)
    private var dismiss
    
    @FocusState
    private var focuseField: FocusableField?
    
    @State
    var reminder = Reminder(title: "")

    var onCommit: (_ reminder: Reminder) -> Void
    
    enum FocusableField: Hashable {
        case title
    }
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Here", text: $reminder.title)
                    .focused($focuseField, equals: .title)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "New Reminder" : "Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(mode == .add ? "Add" : "Done", action: commit)
                    .disabled(reminder.title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                   Button("Cancel", action: cancel)
                }
            }
            .onAppear{
                focuseField = .title
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    struct Container: View {
       @State var reminder = Reminder.samples[0]
       var body: some View {
         EditReminderDetailsView(mode: .edit, reminder: reminder) { reminder in
           print("You edited a reminder: \(reminder.title)")
         }
       }
     }
     
     static var previews: some View {
       EditReminderDetailsView { reminder in
         print("You added a reminder: \(reminder.title)")
       }
       Container()
     }
}
