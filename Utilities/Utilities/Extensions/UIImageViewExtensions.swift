//
//  UIImageViewExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

// Used for caching images. Should be optimised.
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    public func setImage(with url: String) {
        guard let imageURL = URL(string: url) else { return }
        setImage(with: imageURL)
    }
    
    public func setImage(with url: URL) {        
        getImage(from: url) { [weak self] (image) in
            DispatchQueue.main.async() {
                self?.image = image
            }
        }
    }
    
    private func getImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
            return
        }
    
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            
            imageCache.setObject(image, forKey: url.absoluteString as NSString)

            completion(image)
        }
        
        dataTask.resume()
    }
}
