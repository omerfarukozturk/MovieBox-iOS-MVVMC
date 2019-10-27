//
//  Movie.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

public struct Movie: Decodable, Equatable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case copyright
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName: String
    public let releaseDate: Date
    public let name: String
    public let copyright: String?
    public let image: URL
    public let genres: [Genre]
}

public struct Genre: Decodable, Equatable {
    public let name: String
}
