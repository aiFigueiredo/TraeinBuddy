//
//  StationListInteractor.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import Foundation
import Reachability

class StationListInteractor: StationListInteractorInputProtocol {
    weak var presenter: StationListInteractorOutputProtocol?
    var dataManager: StationListDataManagerInputProtocol?
    
    let reachability = Reachability()!
    
    func retrieveStationList() {
        if reachability.connection != .none {
            dataManager?.retrieveStationList(onCompletion: { [weak self] (success, results) in
                if success {
                    self?.presenter?.didRetrieveStationList(results)
                } else {
                    self?.presenter?.onError("An Error Occured")
                }
            })
        } else {
            presenter?.onError("There is no internet connection.")
        }
    }
}
