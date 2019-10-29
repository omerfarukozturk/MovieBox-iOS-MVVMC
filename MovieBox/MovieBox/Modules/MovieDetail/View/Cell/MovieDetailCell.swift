//
//  MovieDetailCell.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var aristNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    func setup(with movie: MovieItem) {
        titleLabel.text = movie.title
        aristNameLabel.text = movie.artistName
        genreLabel.text = movie.genre
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        
        let imageUrl = movie.getImageURL(for: Int(contentView.frame.width))
        posterImageView.setImage(with: imageUrl)
    }
}
