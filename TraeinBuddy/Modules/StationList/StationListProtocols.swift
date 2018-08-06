//
//  StationListProtocols.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import UIKit

protocol StationListWireframeProtocol: class {
    static func createStationListModule() -> UIViewController
    func presentStationDetailScreen(from view: StationListViewProtocol, for station: Station)
}

protocol StationListViewProtocol: class {
    var presenter: StationListPresenterProtocol? { get set }
    
    func showStationList()
    func showError(_ message: String)
}

protocol StationListPresenterProtocol: class {
    var view: StationListViewProtocol? { get set }
    var interactor: StationListInteractorInputProtocol? { get set }
    var wireframe: StationListWireframeProtocol? { get set }
    
    var filteredDataList: [Station] { get set }
    var dataList: [Station] { get set }
    
    func viewDidLoad()
    func showStationsForSearchText(_ text: String)
    func showStationListDetailScreenForStationIndex(_ index: Int, isSearchActive: Bool)
}

protocol StationListInteractorOutputProtocol: class {
    func didRetrieveStationList(_ stations: [Station])
    func onError(_ message: String)
}

protocol StationListInteractorInputProtocol: class {
    weak var presenter: StationListInteractorOutputProtocol? { get set }
    var dataManager: StationListDataManagerInputProtocol? { get set }
    
    func retrieveStationList()
}

protocol StationListDataManagerInputProtocol: class {
    func retrieveStationList(onCompletion: @escaping (Bool, [Station]) -> Void)
}

protocol StationListLocalDataManagerInputProtocol: class {
    func retrieveStationList() throws -> [Station]
}
