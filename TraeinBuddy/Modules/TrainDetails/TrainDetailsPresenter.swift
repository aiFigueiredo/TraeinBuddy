//
//  TrainDetailsPresenter.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation

class TrainDetailsPresenter: TrainDetailsPresenterProtocol {
    weak var view: TrainDetailsViewProtocol?
    var interactor: TrainDetailsInteractorInputProtocol?
    var wireframe: TrainDetailsWireframeProtocol?

    var train: Train?

    func viewDidLoad() {
        if let train = train {
            interactor?.retrieveTrainDetails(for: train.code, and: train.date)
        }
    }
}

extension TrainDetailsPresenter: TrainDetailsInteractorOutputProtocol {

    func didRetrieveTrainDetails(_ trainStops: [TrainStop]) {
        train?.stops = trainStops

        if let train =  train {
            view?.showTrainDetails(train)
        }
    }

    func onError(_ message: String) {
        view?.showError(message)
    }
}
