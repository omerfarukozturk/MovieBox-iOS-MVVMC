//
//  ResourceLoader.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation
@testable import MovieBox
import MovieBoxAPI
import Utilities


class ResourceLoader {
    
    enum MovieResource: String {
        case movie1
        case movie2
        case movie3
    }
    
    static func loadMovie(resource: MovieResource) throws -> MovieItem {
        let bundle = Bundle.init(for: ResourceLoader.self)
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        let movieItem = MovieItem(movie)
        return movieItem
    }
}
