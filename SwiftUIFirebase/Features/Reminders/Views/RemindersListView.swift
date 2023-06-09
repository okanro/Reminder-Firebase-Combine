//
//  ContentView.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import SwiftUI

struct RemindersListView: View {
    @StateObject private var viewModel = RemindersListViewModel()
    @State private var isAddReminderDialogPresented = false
    @State private var editableReminder: Reminder? = nil
    @State private var isSettingScreenPresented = false
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
    
    private func presentSettingScreenView() {
        
    }
    
    var body: some View {
        List($viewModel.reminders) { $reminder in
            RemindersListRowView(reminder: $reminder)
                .swipeActions(edge: .trailing, allowsFullSwipe: true){
                    Button(
                        role: .destructive) {
                            viewModel.deleteReminder(reminder)
                        } label: {
                            Image(systemName: "trash")
                        }
                }
                .onChange(of: reminder.isCompleted) { newValue in
                    viewModel.setCompleted(reminder, isCompleted: newValue)
                }
                .onTapGesture {
                    editableReminder = reminder
                }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button { presentAddReminderView() }
            label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            }
                Spacer()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button { presentSettingScreenView() }
            label: {
                    Image(systemName: "gearshape")
                }

            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            EditReminderDetailsView { reminder in
                print("something do")
                viewModel.addReminder(reminder)
            }
        }
        .sheet(item: $editableReminder, content: { reminder in
            EditReminderDetailsView(mode: .edit) { reminder in
                viewModel.updateReminder(reminder)
            }
        })
        .sheet(isPresented: $isSettingScreenPresented, content: {
//            backhere
        })
        .tint(.red)
    }
}

struct ReminderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RemindersListView()
                .navigationTitle("Reminders")
        }
    }
}

