//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

// - MARK: Coordinator Delegate
protocol MovieDetailCoordinatorViewModelDelegate: class {
    func dismiss()
}

protocol MovieDetailViewModelProtocol {
    var coordinatorDelegate: MovieDetailCoordinatorViewModelDelegate? { get set }
    func getTitle() -> String
    func getDetail() -> MovieItem
    func dismiss()
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var coordinatorDelegate: MovieDetailCoordinatorViewModelDelegate?
    
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
    
    func dismiss() {
        coordinatorDelegate?.dismiss()
    }
}


