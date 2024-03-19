//
//  User.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
