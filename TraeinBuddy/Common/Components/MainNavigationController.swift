//
//  MainNavigationController.swift
//  TraeinBuddy
//
//  Created by Jose Miguel Figueredo on 06/08/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.barTintColor = .darkGreen
        navigationBar.tintColor = .white
    }
}
