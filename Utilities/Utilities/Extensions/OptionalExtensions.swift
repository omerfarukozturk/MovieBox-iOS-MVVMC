//
//  OptionalExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import Foundation

public extension Optional {
    
    struct FoundNilError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilError()
        }
    }
}
