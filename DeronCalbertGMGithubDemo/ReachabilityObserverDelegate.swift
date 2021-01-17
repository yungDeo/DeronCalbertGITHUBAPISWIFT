//
//  ReachabilityObserverDelegate.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/17/21.
//


import Foundation
import Reachability

//Reachability
//declare this property where it won't go out of scope relative to your listener
fileprivate var reachability: Reachability!

protocol ReachabilityActionDelegate {
    func reachabilityChanged(_ isReachable: Bool)
}

protocol ReachabilityObserverDelegate: class, ReachabilityActionDelegate {
    func addReachabilityObserver() throws
    func removeReachabilityObserver()
    
}

//MARK:- Protocol Extension Default Implementation
//NOTE: the art of subscribing and subscribing is easier with Rx
extension ReachabilityObserverDelegate {
    
  
    func addReachabilityObserver() throws {
        reachability = try Reachability()
        
        reachability.whenReachable = { [weak self] reachability in
            self?.reachabilityChanged(true)
        }
        
        reachability.whenUnreachable = { [weak self] reachability in
            self?.reachabilityChanged(false)
        }
        
        try reachability.startNotifier()
    }
    
    
   
    func removeReachabilityObserver() {
        reachability.stopNotifier()
        reachability = nil
    }
}

