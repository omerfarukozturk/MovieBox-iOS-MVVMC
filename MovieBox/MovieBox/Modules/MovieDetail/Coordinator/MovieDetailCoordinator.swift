//
//  MovieDetailCoordinator.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

class MovieDetailCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    let movie: MovieItem
    
    init(navigationController: UINavigationController, movie: MovieItem) {
        self.navigationController = navigationController
        self.movie = movie
    }
    
    func start() {
        let viewModel = MovieDetailViewModel(movie: movie)
        let detailViewController = MovieDetailViewController()
        detailViewController.viewModel = viewModel
        navigationController.show(detailViewController, sender: nil)
    }
}
