//
//  APIClientTests.swift
//  MovieBoxAPITests
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBoxAPI

class APIClientTests: XCTestCase {
    
    func test_response_parse() throws {
        let bundle = Bundle(for: MovieBoxAPITests.self)
        let url = try bundle.url(forResource: "movie", withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        
        XCTAssertEqual(movie.artistName, "Susanna Fogel")
        XCTAssertEqual(movie.name, "The Spy Who Dumped Me")
        XCTAssertEqual(movie.copyright, "© 2018 Lions Gate Films Inc. All Rights Reserved")
        XCTAssertEqual(movie.genres.count, 1)
        XCTAssertEqual(movie.genres.first?.name, "Comedy")
    }
    
    func test_topMovies_completion_called() {
        let exp = expectation(description: "apiCall")
        
        var completionHandlerCalled = false
        let client = TopMoviesService(apiEngine: APIEngine())
        
        client.fetchTopMovies { (_) in
            completionHandlerCalled = true
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
        XCTAssertTrue(completionHandlerCalled)
    }
}
