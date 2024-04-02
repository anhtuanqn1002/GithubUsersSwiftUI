//
//  UserDetailsView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 2/4/24.
//

import SwiftUI

struct UserDetailsView: View {
    @State var user: User
    var body: some View {
        VStack {
            Text(user.login)
            Text(user.name ?? "")
            Text(user.company ?? "")
        }
        .task {
            do {
                user = try await user.getUserDetails()
            } catch {
            
            }
        }
    }
}

#Preview {
    UserDetailsView(user: User(login: "abc", id: 1, nodeId: "", avatarUrl: "", name: "Jame"))
}
