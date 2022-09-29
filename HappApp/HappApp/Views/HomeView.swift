//
//  HomeView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI
import MapKit

struct HomeView: View {
    var vm: AuthViewModel
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }.ignoresSafeArea()
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                }
            }
            AccountView(vm: vm)
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Account")
                }
            }
        }.accentColor(.primary)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: AuthViewModel())
    }
}
