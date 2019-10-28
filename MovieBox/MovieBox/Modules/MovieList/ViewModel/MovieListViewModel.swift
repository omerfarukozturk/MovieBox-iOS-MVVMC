//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation
import MovieBoxAPI

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    var coordinatorDelegate: MovieListCoordinatorViewModelDelegate? { get set}
    
    func getTitle() -> String
    func numberOfItems() -> Int
    func titleForCell(at indexPath: IndexPath) -> String
    func getContent(at indexPath: IndexPath) -> MovieItem
    func getData(completion: @escaping () -> Void)
    func getDataSource(didSelectItemHandler: @escaping MovieListDataSource.MovieDidSelectItemHandler) -> MovieListDataSource
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MovieItem])
}

enum MovieListViewRoute {
    case detail
}

protocol MovieListViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
}

protocol MovieListCoordinatorViewModelDelegate: class {
    func showDetails(of content: MovieItem)
}

final class MovieListViewModel: MovieListViewModelProtocol {
    var coordinatorDelegate: MovieListCoordinatorViewModelDelegate?
    var delegate: MovieListViewModelDelegate?

    var apiClient: TopMoviesServiceProtocol!
    var movies: [MovieItem] = []
    
    init(apiClient: TopMoviesServiceProtocol) {
        self.apiClient = apiClient
    }

    func getTitle() -> String {
        return "Top Movies"
    }
    
    func numberOfItems() -> Int {
        movies.count
    }
    
    func titleForCell(at indexPath: IndexPath) -> String {
        movies[indexPath.row].title
    }
    
    func getContent(at indexPath: IndexPath) -> MovieItem {
        return movies[indexPath.row]
    }
    
    func getData(completion: @escaping () -> Void) {
        apiClient.fetchTopMovies { (result) in
            switch result {
            case .success(let data):
                self.movies = data.results.map({ MovieItem($0) })
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDataSource(didSelectItemHandler: @escaping (MovieItem) -> ()) -> MovieListDataSource {
        MovieListDataSource(with: movies, didSelectItemHandler: didSelectItemHandler)
    }
    
}
