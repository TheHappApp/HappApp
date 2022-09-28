//
//  HappAppApp.swift
//  HappApp
//
//  Created by Turner White on 9/27/22.
//

import SwiftUI
import Firebase

@main
struct HappApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let authViewModel = AuthViewModel()
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
