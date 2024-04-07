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
            
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            
            Spacer()
            Text(user.login)
            Text(user.profile?.name ?? "")
            Text(user.profile?.company ?? "")
            Spacer()
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
    UserDetailsView(user: .fullInfo)
}
