//
//  TrainListInteractor.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation
import Reachability

class TrainListInteractor: TrainListInteractorInputProtocol {
    weak var presenter: TrainListInteractorOutputProtocol?
    var dataManager: TrainListDataManagerInputProtocol?
    
    let reachability = Reachability()!
    
    func retrieveTrainList(for stationCode: String) {
        if reachability.connection != .none {
            dataManager?.retrieveTrainList(forCode: stationCode, onCompletion: { [weak self] (success, results) in
                if success {
                    self?.presenter?.didRetrieveTrainList(results)
                } else {
                    self?.presenter?.onError("An Error Occured")
                }
            })
        } else {
            presenter?.onError("There is no internet connection.")
        }
    }
    
}
