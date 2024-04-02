//
//  ContentView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                ListUsersView()
                    .navigationTitle("Users")
            }.tabItem {
                Label("Users", systemImage: "list.bullet.clipboard.fill")
            }
            
            NavigationView {
                SearchView()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

#Preview {
    MainView()
}
