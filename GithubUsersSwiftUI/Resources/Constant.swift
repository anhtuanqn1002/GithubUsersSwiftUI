//
//  Constant.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 19/3/24.
//

import Foundation

enum Constant {}
extension Constant {
    enum API {
        static var baseURLString: String {
            "https://api.github.com"
        }
        
        static var baseHeader: [String: String] {
            ["Content-Type": "application/json"]
        }
    }
}
