//
//  MockTopMoviesService.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation
import MovieBoxAPI

final class MockTopMoviesService: TopMoviesServiceProtocol {
    var movies: [Movie] = []

    func fetchTopMovies(completion: @escaping (Result<TopMoviesResponse>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies)))
    }
}
