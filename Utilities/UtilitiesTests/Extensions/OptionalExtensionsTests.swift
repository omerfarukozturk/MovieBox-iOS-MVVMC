//
//  OptionalExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Ömer Faruk Öztürk on 23.11.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import Utilities

class OptionalExtensionsTests: XCTestCase {
    
    func test_optional_extension_unwrapThrows() {
        let item: Int? = nil
        XCTAssertThrowsError(try item.unwrap())
    }
    
    func test_optional_extension_unwrapReturnsWrapped() {
        let item: Int? = 1
        XCTAssertEqual(try item.unwrap(), 1)
    }
}
