//
//  APIEngineTests.swift
//  MovieBoxAPITests
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
import Utilities
@testable import MovieBoxAPI

class MovieBoxAPITests: XCTestCase {

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
    
    func test_apiEngine_callsCompletion() {
        let session = createMockSession()
        let engine = createEngine(session: session)
        
        var completionCalled = false
        
        engine.get(url: URL(string: "https://")!) { (_, _) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
    
    func test_apiEngine_calls_correctUrl() {
        
        let session = createMockSession()
        let engine = createEngine(session: session)
        
        let url = URL(string: "https://")!
        engine.get(url: url, completion: { (_, _) in })
        
        XCTAssertEqual(session.currentURL, url)
    }
    
    func test_apiEngine_callsDataTaskResume() {
        let mockDataTask = MockURLDataTask()
        let session = createMockSession(dataTask: mockDataTask)
        let engine = createEngine(session: session)
        
        engine.get(url: URL(string: "https://")!, completion: { (_, _) in })
        
        XCTAssertTrue(mockDataTask.resumeCalled)
    }
}

//MARK: - Helpers
extension MovieBoxAPITests {
    
    private func createMockSession(dataTask: MockURLDataTask = MockURLDataTask()) -> MockURLSession {
        return MockURLSession(dataTask: dataTask)
    }
    
    private func createEngine(session: MockURLSession) -> APIEngine {
        return APIEngine(urlSession: session)
    }
}

final class MockURLDataTask: URLSessionDataTaskProtocol {

    var resumeCalled = false

    func resume() {
        resumeCalled = true
    }
}

final class MockURLSession: URLSessionProtocol {
    
    var dataTask: URLSessionDataTaskProtocol
    var currentURL: URL?

    init(dataTask: URLSessionDataTaskProtocol) {
         self.dataTask = dataTask
     }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTaskProtocol {
        currentURL = request.url
        completionHandler(nil, nil, nil)
        return dataTask
    }
}

