//
//  TrainDetailsInteractor.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation
import Reachability

class TrainDetailsInteractor: TrainDetailsInteractorInputProtocol {
    weak var presenter: TrainDetailsInteractorOutputProtocol?
    var dataManager: TrainDetailsDataManagerInputProtocol?

    let reachability = Reachability()!

    func retrieveTrainDetails(for code: String, and date: String) {
        if reachability.connection != .none {
            dataManager?.retrieveTrainDetails(forCode: code, and: date, onCompletion: { [weak self] (success, result) in
                if success {
                    self?.presenter?.didRetrieveTrainDetails(result)
                } else {
                    self?.presenter?.onError("An Error Occured")
                }
            })
        }
        else {
            presenter?.onError("There is no internet connection.")
        }
    }
}
