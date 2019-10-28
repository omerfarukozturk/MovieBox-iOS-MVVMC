//
//  UICollectionViewCellExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class var identifier: String {
         return String(describing: self)
    }
}
