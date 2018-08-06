//
//  StationListPresenter.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import Foundation

class StationListPresenter: StationListPresenterProtocol {
    weak var view: StationListViewProtocol?
    var interactor: StationListInteractorInputProtocol?
    var wireframe: StationListWireframeProtocol?
    var dataList = [Station]()
    var filteredDataList = [Station]()
    
    func viewDidLoad() {
        interactor?.retrieveStationList()
    }
    
    func showStationsForSearchText(_ text: String) {
        let tempList = dataList

        filteredDataList = tempList.filter { station -> Bool in
            station.name.contains(text) || station.code.contains(text)
        }

        view?.showStationList()
    }
    
    func showStationListDetailScreenForStationIndex(_ index: Int, isSearchActive: Bool) {
        if let view = view {
            wireframe?.presentStationDetailScreen(from: view,
                                                  for: isSearchActive ? filteredDataList[index] : dataList[index])
        }
    }
}

extension StationListPresenter: StationListInteractorOutputProtocol {
    func didRetrieveStationList(_ stations: [Station]) {
        dataList = stations
        view?.showStationList()
    }

    func onError(_ message: String) {
        view?.showError(message)
    }
}
