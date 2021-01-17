//
//  EasyMockGitHubService.swift
//  DeronCalbertGMGithubDemoTests
//
//  Created by Calbert, Deron on 1/17/21.
//

import Foundation
@testable import DeronCalbertGMGithubDemo
class EasyMockGitHubService: GitService {
    var commits: CommitModel?
    init(commit:CommitModel?) {
        self.commits = commit
    }
    func getCommits(owner: String, repo: String, page: String, completion: @escaping CommitCompletion) {
        completion(commits)
    }
    
    
}
