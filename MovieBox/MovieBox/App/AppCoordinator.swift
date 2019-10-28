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

    init(window: UIWindow) {
        self.window = window
        self.apiEngine = APIEngine()
        self.apiClient = TopMoviesService(apiEngine: apiEngine)
    }
    
    func start() {
        guard let window = window else { return }
               
        rootViewController = UINavigationController(rootViewController: MovieListViewController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func getMovieListViewController() -> MovieListViewController {
        let viewModel = MovieListViewModel(apiClient: apiClient)
        viewModel.coordinatorDelegate = self
        let viewController = MovieListViewController(viewModel: viewModel)
        return viewController
    }
}

extension AppCoordinator: MovieListCoordinatorViewModelDelegate {
    
    func showDetails(of content: MovieItem) {
        //TODO: navigate to detail
    }
}
