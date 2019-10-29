//
//  MovieDetailViewTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBox

class MovieDetailViewTest: XCTestCase {
    
    func test_detail_controller_deinited(){
        let exp = expectation(description: "deinit")
        
        var sut: MockDetailView? = MockDetailView()
        let movieItem = MovieItem(title: "Test", detail: "Detail", imageUrl: URL(string: "https://")!)
        let viewModel = MovieDetailViewModel(movie: movieItem)
        sut?.viewModel = viewModel
        
        sut?.deinitCalled = {
            exp.fulfill()
        }
        
        DispatchQueue.global(qos: .background).async {
            sut = nil
        }
        
        waitForExpectations(timeout: 4.0)
    }
}

private class MockDetailView: MovieDetailViewController {
    var deinitCalled: (() -> Void)?
    deinit { deinitCalled?() }
}
