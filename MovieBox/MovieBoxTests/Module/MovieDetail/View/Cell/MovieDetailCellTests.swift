//
//  MovieDetailCellTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBox

class MovieDetailCellTests: XCTestCase {
    
    func test_setup_rendersCorrectData() throws {
        let sut = makeSUT()
        let movie = try ResourceLoader.loadMovie(resource: .movie1)
        sut.setup(with: movie)
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertEqual(sut.titleLabel.text, movie.title)
        
        XCTAssertNotNil(sut.aristNameLabel)
        XCTAssertEqual(sut.aristNameLabel.text, movie.artistName)
        
        XCTAssertNotNil(sut.genreLabel)
        XCTAssertEqual(sut.genreLabel.text, movie.genre)
            
        XCTAssertNotNil(sut.releaseDateLabel)
        XCTAssertEqual(sut.releaseDateLabel.text, "Release Date: \(movie.releaseDate)")
            
        XCTAssertNotNil(sut.posterImageView)
    }
    
    // MARK: Helpers
    
    func makeSUT() -> MovieDetailCell {
        let nib = UINib(nibName: MovieDetailCell.identifier, bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! MovieDetailCell
        return cell
    }
}
