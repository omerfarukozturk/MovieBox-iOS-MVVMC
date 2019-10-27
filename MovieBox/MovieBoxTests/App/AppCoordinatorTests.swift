//
//  AppCoordinatorTests.swift
//  MovieBoxTests
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import MovieBox

class AppCoordinatorTest: XCTestCase {
    
    func test_app_coordinator_createst_rootViewController() {
        let coordinator = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
        coordinator.start()
        XCTAssertNotNil(coordinator.rootViewController)
    }
}
