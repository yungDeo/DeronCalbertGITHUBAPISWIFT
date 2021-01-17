//
//  CommitModel.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation

typealias ComitModel = [ComitModelElement]

// MARK: - ComitModelElement
struct ComitModelElement: Codable {
    let url: String?
    let sha, nodeID: String?
    let htmlURL, commentsURL: String?
    let commit: Commit?
    let author, committer: ComitModelAuthor?
    let parents: [Tree]?

    enum CodingKeys: String, CodingKey {
        case url, sha
        case nodeID
        case htmlURL
        case commentsURL
        case commit, author, committer, parents
    }
}

// MARK: - ComitModelAuthor
struct ComitModelAuthor: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID
        case avatarURL
        case gravatarID
        case url
        case htmlURL
        case followersURL
        case followingURL
        case gistsURL
        case starredURL
        case subscriptionsURL
        case organizationsURL
        case reposURL
        case eventsURL
        case receivedEventsURL
        case type
        case siteAdmin
    }
}

// MARK: - Commit
struct Commit: Codable {
    let url: String?
    let author, committer: CommitAuthor?
    let message: String?
    let tree: Tree?
    let commentCount: Int?
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case url, author, committer, message, tree
        case commentCount
        case verification
    }
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name, email: String?
    let date: Date?
}

// MARK: - Tree
struct Tree: Codable {
    let url: String?
    let sha: String?
}

// MARK: - Verification
struct Verification: Codable {
    let verified: Bool?
    let reason: String?
    let signature, payload: String?
}


