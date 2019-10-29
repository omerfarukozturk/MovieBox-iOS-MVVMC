//
//  UtilitiesTests.swift
//  UtilitiesTests
//
//  Created by Ömer Faruk Öztürk on 27.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import Utilities

class UtilitiesTests: XCTestCase {
    
    func test_optional_extension_unwrapThrows() {
        // Given:
        let item: Int? = nil
        
        // Then:
        XCTAssertThrowsError(try item.unwrap())
    }
    
    func test_optional_extension_unwrapReturnsWrapped() {
        // Given:
        var item: Int?
        
        // When:
        item = 1
        
        // Then:
        XCTAssertEqual(try item.unwrap(), 1)
    }
    
    func test_array_extension_elementAtThrows() throws {
        // Given:
        let emptyArray: [Int] = [1, 2, 3]
        
        // Then:
        XCTAssertThrowsError(try emptyArray.element(at: 3))
    }
    
    func test_array_extension_elementAtReturns() throws {
        // Given:
        let emptyArray: [Int] = [1, 2, 3]
        
        // Then:
        XCTAssertEqual(try emptyArray.element(at: 0), 1)
    }
}
