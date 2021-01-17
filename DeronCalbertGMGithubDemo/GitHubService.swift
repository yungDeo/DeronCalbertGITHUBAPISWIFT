//
//  GitHubService.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//


import Foundation
import OSLog

class GitHubService:GitService {
    //MARK:- Github Commits Call
    private let logger = Logger(subsystem: "NetworkService", category: "githubservice")
    
    func getCommits(owner:String ,repo:String ,page:String  ,completion: @escaping CommitCompletion) {
        
        let path = "repos/\(owner)/\(repo)/commits"
        let itemsPerPagequeryItem = URLQueryItem(name: "per_page", value: "25")
        let pagingQueryItems = URLQueryItem(name: "page", value: page)
        let allQueryItems = [itemsPerPagequeryItem,pagingQueryItems]
       
        let decoder = JSONDecoder()
        
        NetworkManager.shared.getTokenNetworkCall(for: path, allQueryItems) { (data) in
            if let data = data {
                
                do {
                    let commits = try decoder.decode(CommitModel.self, from: data)
                    
                    completion(commits)
                }catch let jsonError  {
                    
                   self.logger.error("Logging: \(jsonError.localizedDescription, privacy: .public)")
                    completion(nil)
                }
            }
        
        }
    }
    
    
}
