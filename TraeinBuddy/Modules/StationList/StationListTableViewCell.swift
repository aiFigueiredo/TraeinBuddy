//
//  StationListTableViewCell.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class StationListTableViewCell: UITableViewCell {

    @IBOutlet private weak var aliasLabel: UILabel!
    @IBOutlet private weak var codeLabel: UILabel!
    
    static let cellId = "stationCell"
    
    func set(title: String, subTitle: String) {
        aliasLabel.text = title
        codeLabel.text = subTitle
    }
}
