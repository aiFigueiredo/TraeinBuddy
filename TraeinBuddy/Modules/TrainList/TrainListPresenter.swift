//
//  TrainListPresenter.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation

class TrainListPresenter: TrainListPresenterProtocol {
    weak var view: TrainListViewProtocol?
    var interactor: TrainListInteractorInputProtocol?
    var wireframe: TrainListWireframeProtocol?
    var station: Station?
    var dataList = [Train]()

    @objc func viewDidLoad() {
        if let code = station?.code {
            interactor?.retrieveTrainList(for: code)
        }
    }

    func showTrainListDetailScreenForTrainAtIndex(_ index: Int) {
        if let view = view {
            wireframe?.presentTrainPickerScreen(from: view, for: dataList[index])
        }
    }
}

extension TrainListPresenter: TrainListInteractorOutputProtocol {
    func didRetrieveTrainList(_ trains: [Train]) {
        dataList = trains
        view?.showTrainList()
    }

    func onError(_ message: String) {
        view?.showError(message)
    }
}
