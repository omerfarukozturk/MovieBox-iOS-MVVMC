//
//  MovieDetailViewModelTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBox

class MovieDetailViewModelTests: XCTestCase {
    
    func test_viewModel_renderMovie() throws {
        // Given:
        let movie = try ResourceLoader.loadMovie(resource: .movie1)
        let sut = try makeSUT()
        
        // Then:
        XCTAssertEqual(sut.getMovieDetail(), movie)
    }
    
    // MARK: Helpers
    func makeSUT() throws -> MovieDetailViewModel {
        let movie = try ResourceLoader.loadMovie(resource: .movie1)
        let viewModel = MovieDetailViewModel(movie: movie)
        return viewModel
    }
}
