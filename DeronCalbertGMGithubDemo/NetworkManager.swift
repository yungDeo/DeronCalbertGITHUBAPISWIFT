//
//  NetworkManager.swift
//  DeronCalbertGMGithubDemo
//
//  Created by Calbert, Deron on 1/16/21.
//

import Foundation
import Alamofire
class NetworkManager {
    let sessionManager: Session
    let baseURL = URL(string: "https://api.github.com")!
    
    
    
    // MARK: - Singleton Accessors
    fileprivate static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        sessionManager = Session(configuration: config )
    }
    func getTokenNetworkCall( for path: String, _ queryItems: [URLQueryItem] = [], completion: @escaping (_ data: Data?, _ error: NSError?) -> Void) {
        
        let url = baseURL.appendingPathComponent(path)
        var urlComponents = URLComponents(string: url.absoluteString)
        
        urlComponents?.queryItems = queryItems
        guard let requesturl = urlComponents?.url else {
            return
        }
        let request = sessionManager.request(requesturl, method: .get)
        
        request.responseJSON { payload in
            switch payload.result{
            case .success:
                guard let statusCode = payload.response?.statusCode else {
                    
                    completion(nil, nil)
                    return
                }
                switch statusCode {
                case 200:
                    completion( payload.data ?? Data(), nil )
                case 401, 400:
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
