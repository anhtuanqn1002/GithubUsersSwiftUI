//
//  Profile.swift
//  GithubUsersSwiftUI
//
//  Created by Tung Tran on 4/7/24.
//

import Foundation

struct Profile: Hashable, Codable {
    var name: String?
    var company: String?
    var blog: String
    var location: String?
    var email: String?
    var hireable: Bool?
    var bio: String?
    var twitterUsername: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var createdAt: String
    var updatedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
