//
//  ListUsersView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import SwiftUI

struct ListUsersView: View {
    var users: [User] = [User(name: "a"), User(name: "a1")]
    
    var body: some View {
        List(users) { user in
            ListUserRowView(user: user)
        }
    }
}

#Preview {
    ListUsersView()
}
