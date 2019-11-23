//
//  MovieListViewTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 23.11.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBox
@testable import MovieBoxAPI

class MovieListViewTests: XCTestCase {

    func test_movieList_load()  {
        let service = MockTopMoviesService()
        let viewModel = MovieListViewModel(apiClient: service)
        let viewController = MovieListViewController()
        viewController.viewModel = viewModel
        
        _ = viewController.view
    
        XCTAssertNotNil(viewController.collectionView)
    }
}
