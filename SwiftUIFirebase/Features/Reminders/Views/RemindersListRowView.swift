//
//  RemindersListRowView.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import SwiftUI

struct RemindersListRowView: View {
    @Binding var reminder: Reminder
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) {
                
            }.toggleStyle(.reminder)
            Text(reminder.title)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}


struct RemindersListRowView_Previews: PreviewProvider {
    struct Container: View {
        @State var reminder = Reminder.samples[0]
        var body: some View {
            List {
                RemindersListRowView(reminder: $reminder)
            }.listStyle(.plain)
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Container()
                .navigationTitle("Reminders")
        }
    }
}
