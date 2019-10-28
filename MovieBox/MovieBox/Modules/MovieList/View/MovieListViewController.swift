//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit
import Utilities

final class MovieListViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private var dataSource: MovieListDataSource?
    
    private var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    convenience init(viewModel: MovieListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: UI

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        registerCells()
        getMovies()
    }
    
    // MARK: Data
    
    public func reloadData() {
        dataSource = viewModel.getDataSource { [weak self] (movie) in
            self?.viewModel.coordinatorDelegate?.showDetails(of: movie)
        }
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
    }
    
    private func prepareUI() {
         title = viewModel.getTitle()
         navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    private func registerCells() {
        collectionView.register(MovieItemCell.self)
    }
    
    private func getMovies() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        
    }
}
