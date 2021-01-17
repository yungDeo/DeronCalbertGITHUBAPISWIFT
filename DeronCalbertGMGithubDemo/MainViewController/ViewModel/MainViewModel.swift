//
//  MainViewModel.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation
import OSLog

class MainViewModel:ReachabilityObserverDelegate {
    var isReachable:Bool = true
    
    let service:GitService
    var commits:CommitModel = []
    let logger = Logger(subsystem: "MainViewController.mainViewModel", category: "reachability")
    init(service:GitService) {
        self.service = service
        initObserver()
        
    }
    
    deinit {
        removeReachabilityObserver()
    }
    func getCommits(completion:@escaping (_ completed:Bool)->Void) {
        if isReachable{
        service.getCommits(owner: "AlamoFire", repo: "AlamoFire", page: "0"){commit in
            
            if let commit = commit  {
                self.commits.append(contentsOf: commit)
            }
            completion(true)
        }
        }else {
            let errorMessage = "no internet service"
            
            logger.error("\(errorMessage,privacy: .public)")
            completion(false)
        }
    }
    //MARK:- Reachability Delegate methods
    func reachabilityChanged(_ isReachable: Bool) {
        self.isReachable = isReachable
    }
    func initObserver() {
        do {
            try addReachabilityObserver()
        }catch let error  {
            logger.error("\(error.localizedDescription, privacy: .public)")
        }
    }
}

