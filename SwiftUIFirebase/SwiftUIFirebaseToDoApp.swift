//
//  SwiftUIFirebaseApp.swift
//  SwiftUIFirebase
//
//  Created by Okan Özdemir on 5.06.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          
            FirebaseApp.configure()
            return true
        }
}

@main
struct SwiftUIFirebaseToDoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RemindersListView()
                    .navigationTitle("Reminders")
            }
        }
    }
}
