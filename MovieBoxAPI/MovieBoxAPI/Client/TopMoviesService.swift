//
//  TopMoviesService.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

public protocol TopMoviesServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void)
}

public class TopMoviesService: TopMoviesServiceProtocol {
    
    public var apiEngine: APIEngineProtocol
    
    public init(apiEngine: APIEngineProtocol) {
        self.apiEngine = apiEngine
    }
    
    public func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        guard let url = URL(string: APIEndPoints.explicit.buildUrl()) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            let decoder = Decoders.plainDateDecoder
            if let response = try? decoder.decode(TopMoviesResponse.self, from: data) {
                completion(.success(response))
            } else {
                completion(.failure(APIError.invalidResponse))
            }
        }
    }
}
