//
//  UserDetailsView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 2/4/24.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UserDetailsView(user: User(login: "abc", id: 1, nodeId: "", avatarUrl: "", name: "Jame"))
}
