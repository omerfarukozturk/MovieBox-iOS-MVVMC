//
//  UITableViewCellExtensions.swift
//  Utilities
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    public class var identifier: String {
        return String(describing: self)
    }
}
