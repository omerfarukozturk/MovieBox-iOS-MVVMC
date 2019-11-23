//
//  UIImageViewExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Ömer Faruk Öztürk on 23.11.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import XCTest
@testable import Utilities

class UIImageViewExtensionsTests: XCTestCase {
    
    func test_imageView_setImageWithURL() {
        let imageView = UIImageView()
        
        let image = UIColor.red.toImage(width: 1, height: 1)
        let session = URLSessionMock(data: image.pngData())
        imageLoader = ImageLoader(session)
        
        let exp = expectation(description: "imageLoad")
        
        imageView.setImage(with: URL(string: "https://")!) { (succed) in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { (_) in
            XCTAssertNotNil(imageView.image)
        }
    }
    
    func test_imageView_setImageFromCache() {
        let imageView = UIImageView()
        let image = UIColor.red.toImage(width: 1, height: 1)
        imageLoader = ImageLoader()
        
        let imageUrl = "https://testimageUrl.png"
        imageLoader.cacheImage(key: imageUrl, image: image)
        
        XCTAssertNil(imageView.image)
        
        let exp = expectation(description: "imageLoad")
        imageView.setImage(with: imageUrl) { (succed) in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { (_) in
            XCTAssertNotNil(imageView.image)
        }
    }
}

private class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

private class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var error: Error?
    
    init(data: Data?) {
        self.data = data
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        
        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}
