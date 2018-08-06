//
//  StationListTableViewController.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import UIKit

class StationListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    var presenter: StationListPresenterProtocol?
    private var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupTableView()
        setupSearchController()
        activityIndicator.startAnimating()
        presenter?.viewDidLoad()
    }

    // MARK: - View Setup

    private func setupNavigationItems() {
        title = "Select a Station"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.refresh,
                                                            target:self,
                                                            action:#selector(StationListViewController.refreshData))
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName:"StationListTableViewCell", bundle: nil),
                           forCellReuseIdentifier:StationListTableViewCell.cellId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
    }
    
    private func setupSearchController() {
        searchController = MainSearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.delegate = self

        if let searchController = searchController {
            tableView.tableHeaderView = searchController.searchBar
        }

        definesPresentationContext = true
    }

    // MARK - Actions

    @objc func refreshData() {
        activityIndicator.startAnimating()
        presenter?.viewDidLoad()
        tableView.reloadData()
    }
}

extension StationListViewController: StationListViewProtocol {
    func showStationList() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }

    func showError(_ message: String) {
        activityIndicator.stopAnimating()
        showAlert(message: message)
    }
}

extension StationListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StationListTableViewCell.cellId,
                                                 for: indexPath) as! StationListTableViewCell
        if let presenter = presenter {
            var station : Station
            
            if let searchController = searchController {
                let isSearchActive = searchController.isActive && searchController.searchBar.text!.count > 1
                station = isSearchActive ? presenter.filteredDataList[indexPath.row] : presenter.dataList[indexPath.row]
            } else {
                station = presenter.dataList[indexPath.row]
            }
            
            cell.set(title:station.name, subTitle:station.code)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let presenter = presenter {
            if
                let searchController = searchController,
                searchController.isActive {
                return presenter.filteredDataList.count
            } else {
                return presenter.dataList.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let presenter = presenter {
            var isSearchActive = false
            if
                let searchController = searchController,
                let searchText = searchController.searchBar.text {
                isSearchActive = searchController.isActive && searchText.count > 1
            }
            
            presenter.showStationListDetailScreenForStationIndex(indexPath.row, isSearchActive: isSearchActive)
        }
    }
}

extension StationListViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if
            let searchString = searchController.searchBar.text,
            searchString.count > 1 {
            presenter?.showStationsForSearchText(searchString);
        }
    }
}

extension StationListViewController : UISearchControllerDelegate {
    func willDismissSearchController(_ searchController: UISearchController) {
        presenter?.viewDidLoad()
    }
}
