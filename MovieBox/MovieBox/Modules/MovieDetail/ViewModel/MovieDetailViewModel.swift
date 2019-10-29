//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    func getTitle() -> String
    func getDetail() -> MovieItem
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    private var movie: MovieItem!
    
    init(movie: MovieItem) {
        self.movie = movie
    }
    
    func getTitle() -> String {
        return movie.title
    }
    
    func getDetail() -> MovieItem {
        return movie
    }
}

// - MARK: Coordinator Delegate
protocol MovieDetailCoordinatorViewModelDelegate: class {
    func dismiss()
}
