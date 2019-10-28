//
//  MovieItemCell.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit
import Utilities

final class MovieItemCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8.0
    }

    func setup(with movie: MovieItem) {
        posterImage.setImage(with: movie.imageUrl)
    }
}
