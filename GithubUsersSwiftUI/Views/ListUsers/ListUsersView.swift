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
        List(users) { user in
            ListUserRowView(user: user)
        }
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

#Preview {
    ListUsersView()
}
