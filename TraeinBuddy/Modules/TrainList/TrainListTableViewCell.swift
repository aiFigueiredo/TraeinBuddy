//
//  TrainListTableViewCell.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class TrainListTableViewCell: UITableViewCell {

    static let cellId = "trainCell"
    
    @IBOutlet private weak var trainTypeLabel: UILabel!
    @IBOutlet private weak var originLabel: UILabel!
    @IBOutlet private weak var destinationLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var dueInLabel: UILabel!
    
    func set(type: String, code: String, origin: String, destination: String, status: String, dueIn: String) {
        trainTypeLabel.text = "\(type) ( \(code))"
        originLabel.text = origin
        destinationLabel.text = destination
        statusLabel.text = status
        dueInLabel.text = "\(dueIn) min"
    }
}
