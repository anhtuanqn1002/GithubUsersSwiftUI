//
//  User.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let login: String
    let id: Int
    let nodeId: String
    var avatarUrl: String
    var gravatarId: String
    var url: String
    var htmlUrl: String
    var followersUrl: String
    var followingUrl: String
    var gistsUrl: String
    var starredUrl: String
    var subscriptionsUrl: String
    var organizationsUrl: String
    var reposUrl: String
    var eventsUrl: String
    var receivedEventsUrl: String
    var type: String
    var siteAdmin: Bool
    
    var profile: Profile?
    
    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    static func all() async throws -> [User] {
        let network = GithubUserAPI()
        do {
            return try await network.getListUsers()
        } catch {
            throw GetUsersError.cantGetUsers
        }
    }
    
    mutating func getUserDetails() async throws -> User {
        let network = GithubUserAPI()
        do {
            profile = try await network.getUser(id: login)
            return self
        } catch {
            throw GetUserDetailsError(code: (error as NSError).code)
        }
    }
    
    func getRepos() async throws -> UserRepository {
        let network = GithubUserAPI()
        return try await network.getRepos(userId: login)
    }
}

// MARK: - Error
extension User {
    enum GetUsersError: Error {
        case cantGetUsers
    }
    
    enum GetUserDetailsError: Error {
        case userNotFound
        case cantGetDetails
        
        init(code: Int) {
            switch code {
            case 404:
                self = .userNotFound
            default:
                self = .cantGetDetails
            }
        }
    }
}

// MARK: - Preview
extension User {
    static var fullInfo: User {
        let str = #"""
        {
            "login": "1",
            "id": 1825798,
            "node_id": "MDQ6VXNlcjE4MjU3OTg=",
            "avatar_url": "https://avatars.githubusercontent.com/u/1825798?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/1",
            "html_url": "https://github.com/1",
            "followers_url": "https://api.github.com/users/1/followers",
            "following_url": "https://api.github.com/users/1/following{/other_user}",
            "gists_url": "https://api.github.com/users/1/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/1/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/1/subscriptions",
            "organizations_url": "https://api.github.com/users/1/orgs",
            "repos_url": "https://api.github.com/users/1/repos",
            "events_url": "https://api.github.com/users/1/events{/privacy}",
            "received_events_url": "https://api.github.com/users/1/received_events",
            "type": "User",
            "site_admin": false,
            "name": "Michael",
            "company": null,
            "blog": "",
            "location": "San Francisco, CA",
            "email": null,
            "hireable": null,
            "bio": null,
            "twitter_username": null,
            "public_repos": 1,
            "public_gists": 0,
            "followers": 55,
            "following": 0,
            "created_at": "2012-06-07T06:10:07Z",
            "updated_at": "2024-01-25T10:52:47Z"
        }
        """#
        
        if let data = str.data(using: .utf8), var user = try? JSONDecoder().decode(User.self, from: data) {
            user.profile = try? JSONDecoder().decode(Profile.self, from: data)
            return user
        }
        
        return .empty
    }
    
    static var basic: User {
        let str = #"""
        {
            "login": "1",
            "id": 1825798,
            "node_id": "MDQ6VXNlcjE4MjU3OTg=",
            "avatar_url": "https://avatars.githubusercontent.com/u/1825798?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/1",
            "html_url": "https://github.com/1",
            "followers_url": "https://api.github.com/users/1/followers",
            "following_url": "https://api.github.com/users/1/following{/other_user}",
            "gists_url": "https://api.github.com/users/1/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/1/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/1/subscriptions",
            "organizations_url": "https://api.github.com/users/1/orgs",
            "repos_url": "https://api.github.com/users/1/repos",
            "events_url": "https://api.github.com/users/1/events{/privacy}",
            "received_events_url": "https://api.github.com/users/1/received_events",
            "type": "User",
            "site_admin": false
        }
        """#
        
        if let data = str.data(using: .utf8) {
            return (try? JSONDecoder().decode(User.self, from: data)) ?? .empty
        }
        
        return .empty
    }
    
    private static var empty: User {
        return .init(
            login: "",
            id: 0,
            nodeId: "",
            avatarUrl: "",
            gravatarId: "",
            url: "",
            htmlUrl: "",
            followersUrl: "",
            followingUrl: "",
            gistsUrl: "",
            starredUrl: "",
            subscriptionsUrl: "",
            organizationsUrl: "",
            reposUrl: "",
            eventsUrl: "",
            receivedEventsUrl: "",
            type: "",
            siteAdmin: false)
    }
}
