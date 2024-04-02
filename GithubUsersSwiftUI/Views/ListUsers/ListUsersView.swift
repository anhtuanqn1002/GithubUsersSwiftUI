//
//  ListUsersView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import SwiftUI

struct ListUsersView: View {
    @State private var users: [User] = []
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    ListUserRowView(user: user)
                }
            }
            .navigationTitle("User List")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    users = try await User.all()
                } catch {
                    users = []
                }
            }
            .refreshable {
                do {
                    users = try await User.all()
                } catch {
                    users = []
                }
            }
        }
    }
}

#Preview {
    ListUsersView()
}
