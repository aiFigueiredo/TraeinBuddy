//
//  TrainListViewController.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class TrainListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var noResultsLabel: UILabel!

    var refreshControl : UIRefreshControl?
    var presenter: TrainListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupTableView()
        presenter?.viewDidLoad()
    }

    // MARK: - View Setup

    private func setupNavigationItems() {
        if
            let presenter = presenter,
            let station = presenter.station {
            title = "Trains for \(station.name)"
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(TrainListViewController.refreshData))
    }

    private func setupTableView() {
        noResultsLabel.isHidden = true

        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "TrainListTableViewCell", bundle: nil),
                           forCellReuseIdentifier: TrainListTableViewCell.cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 125.0
        
        activityIndicator.startAnimating()
    }

    // MARK - Actions

    @objc func refreshData() {
        activityIndicator.startAnimating()
        presenter?.dataList = []
        presenter?.viewDidLoad()
        tableView.reloadData()
    }
}

extension TrainListViewController: TrainListViewProtocol {
    func showTrainList() {
        activityIndicator.stopAnimating()

        if let presenter = presenter {
            noResultsLabel.isHidden = !(presenter.dataList.count == 0)
        }

        tableView.reloadData()
    }

    func showError(_ message: String) {
        activityIndicator.stopAnimating()
        showAlert(message: message)
    }
}

extension TrainListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainListTableViewCell.cellId,
                                                 for: indexPath) as! TrainListTableViewCell
        if let presenter = presenter {
            let train = presenter.dataList[indexPath.row]
            cell.set(type: train.type,
                     code: train.code,
                     origin: train.origin,
                     destination: train.destination,
                     status: train.status,
                     dueIn: "\(train.dueIn)")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataList.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTrainListDetailScreenForTrainAtIndex(indexPath.row)
    }

}
