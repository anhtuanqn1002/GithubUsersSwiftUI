//
//  ListUserRowView.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import SwiftUI

struct ListUserRowView: View {
    let user: User
    var body: some View {
        Text(user.login)
    }
}

#Preview {
    ListUserRowView(user: User(login: "abc", id: 1, nodeId: "", avatarUrl: "", name: "Jame"))
}
