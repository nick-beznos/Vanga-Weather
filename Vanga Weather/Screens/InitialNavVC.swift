//
//  InitialNavVC.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/12/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import UIKit

class InitialNavVC: UINavigationController {
    let searchVC = SearchScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [searchVC]
    }
}
