//
//  MovieListViewModelTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
import MovieBoxAPI
@testable import MovieBox

class MovieListViewModelTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: MovieListViewModel!
    
    override func setUp() {
        let client = MockTopMoviesService()
        viewModel = MovieListViewModel(apiClient: client)
        view = MockView()
        viewModel.delegate = view
    }
    
    func test_viewModel_renders_title(){
        // When:
        viewModel.load()

        // Then:
        XCTAssertEqual(viewModel.getTitle(), "Top Movies")
    }
    
    func test_viewModel_load() throws {
        // When:
        viewModel.load()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        XCTAssertEqual(try view.outputs.element(at: 0), .updateTitle("Top Movies"))
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        XCTAssertEqual(try view.outputs.element(at: 3), .reloadMovieList)
    }
    
    func test_viewModel_getsCorrectContents() throws {
        // Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        viewModel.movies = [movie1, movie2]
        
        // Then:
        XCTAssertEqual(viewModel.getMovieItem(at: IndexPath(row: 0, section: 0)), movie1)
        XCTAssertEqual(viewModel.getMovieItem(at: IndexPath(row: 1, section: 0)), movie2)
    }
}

private class MockView: MovieListViewModelDelegate {
    var outputs: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        outputs.append(output)
    }
    
    func reset(){
        outputs.removeAll()
    }
}
