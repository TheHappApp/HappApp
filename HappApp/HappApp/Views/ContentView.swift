//
//  ContentView.swift
//  HappApp
//
//  Created by Turner White on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationView {
            if authViewModel.isSignedIn {
                HomeView(vm: authViewModel)
            } else {
                WelcomeView(vm: authViewModel)
            }
        }.onAppear {
            authViewModel.signedIn = authViewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
