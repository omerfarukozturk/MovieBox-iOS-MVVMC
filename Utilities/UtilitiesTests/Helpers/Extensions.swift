//
//  Extensions.swift
//  UtilitiesTests
//
//  Created by Ömer Faruk Öztürk on 23.11.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

extension UIColor {
    func toImage(width: Int, height: Int) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
