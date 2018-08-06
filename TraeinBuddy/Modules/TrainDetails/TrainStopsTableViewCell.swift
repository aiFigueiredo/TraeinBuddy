//
//  TrainStopsTableViewCell.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 03/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class TrainStopsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var stopLabel: UILabel!
    
    static let cellId = "trainStopCell"
    
    private func setLabelFont(type: TrainStopType) {
        switch type {
        case .current:
            stopLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            break
        case .next:
            stopLabel.text = "\(stopLabel.text ?? "Error") - Next Stop"
            stopLabel.font = UIFont.systemFont(ofSize: 17.0)
            break
        case .none:
            stopLabel.font = UIFont.systemFont(ofSize: 17.0)
            break
        }
    }
    
    func set(name: String, type: TrainStopType) {
        setLabelFont(type: type)
        stopLabel.text = name
    }
}
