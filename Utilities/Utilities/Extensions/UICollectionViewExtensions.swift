//
//  UICollectionViewExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 28.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func register(_ cell: UICollectionViewCell.Type) {
         register(UINib(nibName: cell.identifier, bundle: nil), forCellWithReuseIdentifier: cell.identifier)
    }
}
