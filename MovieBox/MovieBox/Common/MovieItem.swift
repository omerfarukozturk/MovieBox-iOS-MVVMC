//
//  MovieItem.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation
import MovieBoxAPI

class MovieItem: NSObject {
    let title: String
    let artistName: String
    let imageUrl: URL
    let genre: String
    let releaseDate: String
    
    init(title: String, artistName: String, imageUrl: URL, genre: String, releaseDate: String) {
        self.title = title
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.genre = genre
        self.releaseDate = releaseDate
        super.init()
    }
    
     override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MovieItem else { return false }
        return self.title == other.title && self.artistName == other.artistName && self.imageUrl == other.imageUrl
    }
}

extension MovieItem {
    convenience init(_ movie: Movie) {
        let genre = movie.genres.map({ $0.name }).joined(separator: ", ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let releaseDate = dateFormatter.string(from: movie.releaseDate)
        
        self.init(title: movie.name, artistName: movie.artistName, imageUrl: movie.image, genre: genre, releaseDate: releaseDate)
    }
}

extension MovieItem {
    
    // A workaroud to get different size image for current API.
    func getImageURL(for size: Int) -> URL {
        var imgURL = self.imageUrl
        if imageUrl.absoluteString.hasSuffix("200x200bb.png") {
            let imageUrlString = imageUrl.absoluteString.replacingOccurrences(of: "200x200bb.png", with: "\(size)x\(size)bb.png")
            imgURL = URL(string: imageUrlString)!
        }
        
        return imgURL
    }
}
