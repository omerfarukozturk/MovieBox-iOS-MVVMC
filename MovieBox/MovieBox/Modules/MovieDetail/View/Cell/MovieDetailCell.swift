//
//  MovieDetailCell.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with movie: MovieItem) {
         posterImage.setImage(with: movie.imageUrl)
     }
    
}
