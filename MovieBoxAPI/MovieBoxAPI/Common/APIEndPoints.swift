//
//  APIEndPoints.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

enum APIEndPoints {
    case explicit
    
    func endPoint() -> String {
        switch self {
        case .explicit:
            return "explicit.json"
        }
    }
    
    func buildUrl() -> String {
        return AppConstants.API.baseURL + endPoint()
    }
}
