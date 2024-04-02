//
//  User.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 18/3/24.
//

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
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: Bool?
    var bio: String?
    var twitterUsername: String?
    var publicRepos: Int?
    var publicGists: Int?
    var followers: Int?
    var following: Int?
    var createdAt: String?
    var updatedAt: String?
    
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
    
    init(login: String, id: Int, nodeId: String, avatarUrl: String, name: String?) {
        self.login = login
        self.id = id
        self.nodeId = nodeId
        self.avatarUrl = avatarUrl
        self.gravatarId = ""
        self.url = ""
        self.htmlUrl = ""
        self.followersUrl = ""
        self.followingUrl = ""
        self.gistsUrl = ""
        self.starredUrl = ""
        self.subscriptionsUrl = ""
        self.organizationsUrl = ""
        self.reposUrl = ""
        self.eventsUrl = ""
        self.receivedEventsUrl = ""
        self.type = ""
        self.siteAdmin = false
        self.name = name
        self.company = nil
        self.blog = nil
        self.location = nil
        self.email = nil
        self.hireable = nil
        self.bio = nil
        self.twitterUsername = nil
        self.publicRepos = nil
        self.publicGists = nil
        self.followers = nil
        self.following = nil
        self.createdAt = nil
        self.updatedAt = nil
    }
    
    static func all() async throws -> [User] {
        let network = GithubUserAPI()
        return try await network.getListUsers()
    }
    
    func getUserDetails() async throws -> User {
        let network = GithubUserAPI()
        return try await network.getUser(id: login)
    }
    
    func getRepos() async throws -> UserRepository {
        let network = GithubUserAPI()
        return try await network.getRepos(userId: login)
    }
}
