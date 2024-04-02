//
//  UserRepository.swift
//  GithubUsersSwiftUI
//
//  Created by Tuan Nguyen on 2/4/24.
//

import Foundation

struct UserRepository: Codable {
    let id: Int
    let nodeId: String?
    let name: String?
    let fullName: String?
    let isPrivate: Bool
    let owner: Owner
    let htmlUrl: String
    let description: String?
    let fork: Bool
    let url: String
    let forksUrl: String
    let keysUrl: String
    let collaboratorsUrl: String
    let teamsUrl: String
    let hooksUrl: String
    let issueEventsUrl: String
    let eventsUrl: String
    let assigneesUrl: String
    let branchesUrl: String
    let tagsUrl: String
    let blobsUrl: String
    let gitTagsUrl: String
    let gitRefsUrl: String
    let treesUrl: String
    let statusesUrl: String
    let languagesUrl: String
    let stargazersUrl: String
    let contributorsUrl: String
    let subscribersUrl: String
    let subscriptionUrl: String
    let commitsUrl: String
    let gitCommitsUrl: String
    let commentsUrl: String
    let issueCommentUrl: String
    let contentsUrl: String
    let compareUrl: String
    let mergesUrl: String
    let archiveUrl: String
    let downloadsUrl: String
    let issuesUrl: String
    let pullsUrl: String
    let milestonesUrl: String
    let notificationsUrl: String
    let labelsUrl: String
    let releasesUrl: String
    let deploymentsUrl: String
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let gitUrl: String
    let sshUrl: String
    let cloneUrl: String
    let svnUrl: String
    let homepage: String?
    let size: Int
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let hasIssues: Bool
    let hasProjects: Bool
    let hasDownloads: Bool
    let hasWiki: Bool
    let hasPages: Bool
    let hasDiscussions: Bool
    let forksCount: Int
    let mirrorUrl: String?
    let archived: Bool
    let disabled: Bool
    let openIssuesCount: Int
    let license: License?
    let allowForking: Bool
    let isTemplate: Bool
    let webCommitSignoffRequired: Bool
    let topics: [String]
    let visibility: String
    let forks: Int
    let openIssues: Int
    let watchers: Int
    let defaultBranch: String

    enum CodingKeys: String, CodingKey {
        case id, nodeId = "node_id", name, fullName = "full_name", isPrivate = "private", owner, htmlUrl = "html_url", description, fork, url, forksUrl = "forks_url", keysUrl = "keys_url", collaboratorsUrl = "collaborators_url", teamsUrl = "teams_url", hooksUrl = "hooks_url", issueEventsUrl = "issue_events_url", eventsUrl = "events_url", assigneesUrl = "assignees_url", branchesUrl = "branches_url", tagsUrl = "tags_url", blobsUrl = "blobs_url", gitTagsUrl = "git_tags_url", gitRefsUrl = "git_refs_url", treesUrl = "trees_url", statusesUrl = "statuses_url", languagesUrl = "languages_url", stargazersUrl = "stargazers_url", contributorsUrl = "contributors_url", subscribersUrl = "subscribers_url", subscriptionUrl = "subscription_url", commitsUrl = "commits_url", gitCommitsUrl = "git_commits_url", commentsUrl = "comments_url", issueCommentUrl = "issue_comment_url", contentsUrl = "contents_url", compareUrl = "compare_url", mergesUrl = "merges_url", archiveUrl = "archive_url", downloadsUrl = "downloads_url", issuesUrl = "issues_url", pullsUrl = "pulls_url", milestonesUrl = "milestones_url", notificationsUrl = "notifications_url", labelsUrl = "labels_url", releasesUrl = "releases_url", deploymentsUrl = "deployments_url", createdAt = "created_at", updatedAt = "updated_at", pushedAt = "pushed_at", gitUrl = "git_url", sshUrl = "ssh_url", cloneUrl = "clone_url", svnUrl = "svn_url", homepage, size, stargazersCount = "stargazers_count", watchersCount = "watchers_count", language, hasIssues = "has_issues", hasProjects = "has_projects", hasDownloads = "has_downloads", hasWiki = "has_wiki", hasPages = "has_pages", hasDiscussions = "has_discussions", forksCount = "forks_count", mirrorUrl = "mirror_url", archived, disabled, openIssuesCount = "open_issues_count", license, allowForking = "allow_forking", isTemplate = "is_template", webCommitSignoffRequired = "web_commit_signoff_required", topics, visibility, forks, openIssues = "open_issues", watchers, defaultBranch = "default_branch"
    }
}

struct Owner: Codable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url: String
    let htmlUrl: String
    let followersUrl: String
    let followingUrl: String
    let gistsUrl: String
    let starredUrl: String
    let subscriptionsUrl: String
    let organizationsUrl: String
    let reposUrl: String
    let eventsUrl: String
    let receivedEventsUrl: String
    let type: String
    let siteAdmin: Bool
}

struct License: Codable {
    let key: String?
    let name: String?
    let spdxId: String?
    let url: String?
    let nodeId: String?

    enum CodingKeys: String, CodingKey {
        case key, name, spdxId = "spdx_id", url, nodeId = "node_id"
    }
}
