//
//  GithubAPI.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 2/4/24.
//

import Moya

enum GithubAPIs {
    case getListUsers
    case getUser(userId: String)
    case getRepos(userId: String)
}

extension GithubAPIs: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constant.API.baseURLString) else {
            fatalError("Invalid base URL string: \(Constant.API.baseURLString)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getListUsers:
            return "/users"
        case .getUser(let userId):
            return "/users/\(userId)"
        case .getRepos(let userId):
            return "/users/\(userId)/repos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getListUsers, .getUser, .getRepos:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        Constant.API.baseHeader
    }
}

struct GithubUserAPI {
    var provider = MoyaProvider<GithubAPIs>(plugins: [NetworkLoggerPlugin()])
    
    func getListUsers() async throws -> [User] {
        return try await provider.async.request(.getListUsers)
    }
    
    func getUser(id: String) async throws -> User {
        return try await provider.async.request(.getUser(userId: id))
    }
    
    func getRepos(userId: String) async throws -> UserRepository {
        return try await provider.async.request(.getRepos(userId: userId))
    }
}
