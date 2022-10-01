//
//  TwentyfourApp.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 27.09.22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
    return true
  }
}

@main
struct TwentyfourApp: App {
    //
    let persistenceController = PersistenceController.shared
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // ViewModels
    var profileViewModel: ProfileViewModel
    
    init() {
        FirebaseApp.configure()
        profileViewModel = ProfileViewModel()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(profileViewModel)
        }
    }
}
