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
        HStack {
            Image(.races)
                .resizable()
                .frame(width: 30, height: 30)
            Text(user.login)
                .foregroundStyle(.mainRed)
        }
    }
}

#Preview {
    ListUserRowView(user: .basic)
}
