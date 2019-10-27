//
//  AppCoordinator.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow?
    var rootViewController: UINavigationController!

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let window = window else { return }
               
        rootViewController = UINavigationController(rootViewController: ViewController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
