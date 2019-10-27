//
//  Results.swift
//  MovieBoxAPI
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

