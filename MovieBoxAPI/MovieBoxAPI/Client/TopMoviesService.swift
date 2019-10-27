//
//  TopMoviesService.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

protocol TopMoviesServiceProtocol {
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void)
}

public class TopMoviesService: TopMoviesServiceProtocol {
    
    var apiEngine: APIEngineProtocol
    
    init(apiEngine: APIEngineProtocol) {
        self.apiEngine = apiEngine
    }
    
    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
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
            
            if let response = try? JSONDecoder().decode(TopMoviesResponse.self, from: data) {
                completion(.success(response))
            } else {
                completion(.failure(APIError.invalidResponse))
            }
        }
    }
}
