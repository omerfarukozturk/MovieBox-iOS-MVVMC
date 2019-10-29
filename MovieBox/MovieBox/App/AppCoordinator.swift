//
//  AppCoordinator.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit
import MovieBoxAPI

class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow?
    var rootViewController: UINavigationController!
    var apiEngine: APIEngine!
    let apiClient: TopMoviesServiceProtocol!

    var childCoordinator: CoordinatorProtocol?
    
    init(window: UIWindow) {
        self.window = window
        self.apiEngine = APIEngine()
        self.apiClient = TopMoviesService(apiEngine: apiEngine)
    }
    
    func start() {
        guard let window = window else { return }
               
        let viewModel = MovieListViewModel(apiClient: apiClient)
        viewModel.coordinatorDelegate = self
        let viewController = MovieListViewController()
        viewController.viewModel = viewModel

        rootViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: MovieListCoordinatorViewModelDelegate {
    
    func showDetails(of movie: MovieItem) {
        let detailCoordinator = MovieDetailCoordinator(navigationController: rootViewController, movie: movie)
        childCoordinator = detailCoordinator
        detailCoordinator.start()
    }
}
