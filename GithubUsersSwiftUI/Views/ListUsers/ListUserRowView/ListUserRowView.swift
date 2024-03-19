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
        Text(user.name)
    }
}

#Preview {
    ListUserRowView(user: User(name: "A"))
}
