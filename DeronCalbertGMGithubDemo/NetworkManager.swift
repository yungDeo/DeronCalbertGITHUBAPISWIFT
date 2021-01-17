//
//  NetworkManager.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation
import Alamofire

class NetworkManager {
    private let sessionManager: Session
    private let baseURL = URL(string: "https://api.github.com")!
    
    
    
    // MARK: - Singleton Accessors
    public static let shared:NetworkManager  = NetworkManager()
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        sessionManager = Session(configuration: config )
    }
    
    func getTokenNetworkCall( for path: String,
                              _ queryItems: [URLQueryItem] = [],headers:HTTPHeaders = HTTPHeaders(["accept":"application/vnd.github.v3+json"])
                              , completion: @escaping (_ data: Data?, _ error: NSError?) -> Void) {
        
        let url = baseURL.appendingPathComponent(path)
        var urlComponents = URLComponents(string: url.absoluteString)
        
        urlComponents?.queryItems = queryItems
        guard let requesturl = urlComponents?.url else {
            return
        }
        let request = sessionManager.request(requesturl, method: .get,headers:headers )
        
        request.responseJSON { payload in
            switch payload.result{
            case .success:
                guard let statusCode = payload.response?.statusCode else {
                    
                    completion(nil, nil)
                    return
                }
                switch statusCode {
                case 200:
                    completion( payload.data , nil )
                case 401, 400,500,404:
                    completion(nil, self.processError(response: payload.data ?? Data()))
                    
                default:
                    completion(nil, self.processError(response: payload.data ?? Data()))
                    
                }
            case .failure(let _ ):
                completion(nil,nil)
            }
        }
        
    }

    private func processError(response: Data) -> NSError {

        let decoder = JSONDecoder()
        do {
//            let model = try decoder.decode(ErrorResponse.self, from: response)
            return NSError()
        } catch let(jsonError) {
            print(jsonError.localizedDescription)
            
            return NSError()
        }

    }
}
