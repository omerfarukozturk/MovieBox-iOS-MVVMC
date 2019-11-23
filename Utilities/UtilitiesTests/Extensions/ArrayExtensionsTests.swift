//
//  ArrayExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Ömer Faruk Öztürk on 23.11.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest

class ArrayExtensionsTests: XCTestCase {
    
    func test_array_elementAtReturns() throws {
        let array: [Int] = [0, 1]
        XCTAssertEqual(try array.element(at: 1), 1)
    }
    
    func test_array_elementArThrows() {
        let emptyArray: [Int] = []
        XCTAssertThrowsError(try emptyArray.element(at: 0))
    }
}
