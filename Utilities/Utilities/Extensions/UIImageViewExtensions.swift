//
//  UIImageViewExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

var imageLoader = ImageLoader(session: .shared)

public protocol CancellableRequest {
    func cancel()
}

extension URLSessionDataTask: CancellableRequest { }

extension UIImageView {
    
    public func setImage(with url: String, _ completed: @escaping (Bool) -> Void = {_ in}) {
        guard let imageURL = URL(string: url) else { return }
        setImage(with: imageURL, completed)
    }
    
    public func setImage(with url: URL, _ completed: @escaping (Bool) -> Void = {_ in}) {
        image = nil
        imageLoader.getImage(from: url) { [weak self] (image) in
            DispatchQueue.main.async() {
                self?.image = image
                completed(image != nil)
            }
        }
    }
}

final class ImageLoader {
    private let urlSession: URLSession
    private let imageCache = NSCache<NSString, UIImage>()
    private var downloadTasks: [String: CancellableRequest] = [:]
    
    init(session: URLSession) {
        self.urlSession = session
    }
    
    func cacheImage(key: String, image: UIImage) {
        imageCache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
        let urlString = url.absoluteString
        if let currentTask = downloadTasks[urlString] {
            currentTask.cancel()
            downloadTasks[urlString] = nil
        }
        
        let dataTask = urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            
            guard let self = self else { return }
            self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            
            completion(image)
        }
        dataTask.resume()
        downloadTasks[urlString] = dataTask
    }
}
