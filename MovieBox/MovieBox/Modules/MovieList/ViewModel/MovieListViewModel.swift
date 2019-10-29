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
    var coordinatorDelegate: MovieListCoordinatorViewModelDelegate? { get set }
    
    func load()
    func getTitle() -> String
    func getMovieItem(at indexPath: IndexPath) -> MovieItem
    func selectMovie(at index: Int)    
    func getDataSource() -> MovieListDataSource
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case reloadMovieList
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
    
    func load() {
        notify(.updateTitle(getTitle()))
        notify(.setLoading(true))
        
        apiClient.fetchTopMovies { [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result {
            case .success(let data):
                self.movies = data.results.map({ MovieItem($0) })
                self.notify(.reloadMovieList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTitle() -> String {
        return "Top Movies"
    }
    
    func getMovieItem(at indexPath: IndexPath) -> MovieItem {
        return movies[indexPath.row]
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        coordinatorDelegate?.showDetails(of: movie)
    }
    
    func getDataSource() -> MovieListDataSource {
        let didSelectItemHandler : MovieListDataSource.MovieDidSelectItemHandler = {  [weak self] index in
            self?.selectMovie(at: index)
        }
        
        return MovieListDataSource(with: movies, didSelectItemHandler: didSelectItemHandler)
    }
        
    private func notify(_ output: MovieListViewModelOutput) {
         delegate?.handleViewModelOutput(output)
     }
}
