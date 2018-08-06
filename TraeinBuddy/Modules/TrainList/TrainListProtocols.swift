//
//  TrainListProtocols.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

protocol TrainListViewProtocol: class {
    var presenter: TrainListPresenterProtocol? { get set }
    
    func showTrainList()
    func showError(_ message: String)
}

protocol TrainListWireframeProtocol: class {
    static func createTrainListModule(for station: Station) -> UIViewController
    func presentTrainPickerScreen(from: TrainListViewProtocol, for train: Train)
}

protocol TrainListPresenterProtocol: class {
    var view: TrainListViewProtocol? { get set }
    var interactor: TrainListInteractorInputProtocol? { get set }
    var wireframe: TrainListWireframeProtocol? { get set }
    var station: Station? { get set }
    var dataList: [Train] { get set }
    
    func viewDidLoad()
    func showTrainListDetailScreenForTrainAtIndex(_ index: Int)
}

protocol TrainListInteractorOutputProtocol: class {
    func didRetrieveTrainList(_ trains: [Train])
    func onError(_ message: String)
}

protocol TrainListInteractorInputProtocol: class {
    weak var presenter: TrainListInteractorOutputProtocol? { get set }
    var dataManager: TrainListDataManagerInputProtocol? { get set }
    
    func retrieveTrainList(for stationCode: String)
}

protocol TrainListDataManagerInputProtocol: class {
    func retrieveTrainList(forCode code: String, onCompletion: @escaping (Bool, [Train]) -> Void)
}

protocol TrainListLocalDataManagerInputProtocol: class {
    func retrieveTrainList() throws -> [Train]
}
