//
//  MovieListDataSource.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

final class MovieListDataSource: NSObject {
    typealias MovieDidSelectItemHandler = (MovieItem) -> ()

    var movies: [MovieItem] = []
    var didSelectItemHandler: MovieDidSelectItemHandler

    init(with movies: [MovieItem], didSelectItemHandler: @escaping MovieDidSelectItemHandler) {
        self.movies = movies
        self.didSelectItemHandler = didSelectItemHandler
    }
}

extension MovieListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell() // TODO: return from nib
    }
}

extension MovieListDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        didSelectItemHandler(movie)
    }
}

extension MovieListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.bounds.width - AppConstants.ContentCollection.HorizontalSpaceBetweenItems
        let height: CGFloat = width * AppConstants.ContentCollection.PosterImageRatio
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return AppConstants.ContentCollection.VerticleSpaceBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return AppConstants.ContentCollection.HorizontalSpaceBetweenItems / 2
    }
}
