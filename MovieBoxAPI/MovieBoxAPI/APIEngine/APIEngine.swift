//
//  APIEngine.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

public class APIEngine: APIEngineProtocol {
    
    public var urlSession: URLSessionProtocol
    
    public init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func get(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let request = URLRequest(url: url)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        dataTask.resume()
    }
}
