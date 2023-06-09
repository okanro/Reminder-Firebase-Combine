//
//  ReminderSettingsView.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 8.06.2023.
//

import SwiftUI

struct ReminderSettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isSignUpTouched: Bool = false
    private var isGuestUser: Bool = false
    
    private func signUp() {
        isSignUpTouched.toggle()
    }
    
    private func signIn() {
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink(destination: UserAccountView()) {
                        Label("Account", systemImage: "person.circle.fill")
                    }
                }
                Section {
                    if isGuestUser {
                        Button {
                            signIn()
                        } label: {
                            Text("Sign In")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    } else {
                        Button {
                            signUp()
                        } label: {
                            Text("Sign Up")
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        
                    }
                } footer: {
                    Text("You signed as a man ")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $isSignUpTouched, content: {
                AuthenticationView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .tint(.red)
    }
}

struct ReminderSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSettingsView()
    }
}
