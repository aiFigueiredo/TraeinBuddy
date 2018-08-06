//
//  TrainDetailsViewController.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class TrainDetailsViewController: UIViewController {

    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var originTimeLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lateLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var presenter: TrainDetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        setupTableView()
        presenter?.viewDidLoad()
    }

    //MARK: Setup

    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "TrainStopsTableViewCell", bundle: nil), forCellReuseIdentifier: TrainStopsTableViewCell.cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 125.0
    }
}

extension TrainDetailsViewController: TrainDetailsViewProtocol {
    func showTrainDetails(_ train: Train) {
        originLabel.text = train.origin
        originTimeLabel.text = train.originTime
        destinationLabel.text = train.destination
        destinationTimeLabel.text = train.destinationTime
        statusLabel.text = train.status
        arrivalTimeLabel.text = "This train is due in \(train.dueIn) minutes"

        if
            let lateTime = Int(train.late),
            lateTime > 0 {
            lateLabel.isHidden = false
            lateLabel.text = "+\(train.late)"
        } else {
            lateLabel.isHidden = true
        }

        tableView.reloadData()
    }

    func showError(_ message: String) {
        showAlert(message: message)
    }
}

extension TrainDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainStopsTableViewCell.cellId, for: indexPath) as! TrainStopsTableViewCell

        if
            let presenter = presenter,
            let train = presenter.train {
            let stop = train.stops[indexPath.row]
            cell.set(name: "\(stop.locationName) (\(stop.locationCode))",
                     type: stop.type)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.train?.stops.count ?? 0
    }
}
