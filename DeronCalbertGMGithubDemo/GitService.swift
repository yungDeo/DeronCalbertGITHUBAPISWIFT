//
//  GitService.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation
protocol GitService {
    
    typealias CommitCompletion = (CommitModel?)->Void
    
    
    func getCommits(owner:String,repo:String,page:String,completion: @escaping CommitCompletion)
}
