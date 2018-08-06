//
//  MainSearchController.swift
//  TraeinBuddy
//
//  Created by Jose Miguel Figueredo on 06/08/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class MainSearchController: UISearchController {
    
    override func viewDidLoad() {
        hidesNavigationBarDuringPresentation = true
        dimsBackgroundDuringPresentation = false
        searchBar.searchBarStyle = .prominent
    }
}
