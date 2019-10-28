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
    let detail: String
    let imageUrl: URL
    
    init(title: String, detail: String, imageUrl: URL) {
        self.title = title
        self.detail = detail
        self.imageUrl = imageUrl
        super.init()
    }
    
     override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MovieItem else { return false }
        return self.title == other.title && self.detail == other.detail && self.imageUrl == other.imageUrl
    }
}

extension MovieItem {
    convenience init(_ movie: Movie) {
        self.init(title: movie.name, detail: movie.artistName, imageUrl: movie.image)
    }
}
