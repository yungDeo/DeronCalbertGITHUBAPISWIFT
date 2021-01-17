//
//  MainViewModel.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation

class MainViewModel {
    let service:GitService
    var commits:CommitModel = []
    init(service:GitService) {
        self.service = service
    }
    
    func getCommits(completion:@escaping (_ completed:Bool)->Void) {
        service.getCommits(owner: "AlamoFire", repo: "AlamoFire", page: "0"){commit in
            
            if let commit = commit  {
                self.commits.append(contentsOf: commit)
            }
            completion(true)
        }
    }
}
