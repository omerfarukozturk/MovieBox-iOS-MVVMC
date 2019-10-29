//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by Ömer Faruk Öztürk on 29.10.2019.
//  Copyright © 2019 omerfarukozturk. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePage(_ sender: Any) {
        viewModel.dismiss()
    }
}
