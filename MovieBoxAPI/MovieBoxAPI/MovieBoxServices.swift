//
//  MovieBoxServices.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

protocol TopMoviesServiceProtocol {
    func fetchTopMovies(completion: (Result<TopMoviesResponse>) -> Void)
}

public class TopMoviesService: TopMoviesServiceProtocol {
    
    public enum Error: Swift.Error {
        case parseError(internal: Swift.Error)
        case networkError(interna: Swift.Error)
    }
    
    func fetchTopMovies(completion: (Result<TopMoviesResponse>) -> Void) {
        //TODO: service call
    }
}
