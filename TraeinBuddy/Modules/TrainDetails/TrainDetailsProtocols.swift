//
//  TrainDetailsProtocols.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

protocol TrainDetailsViewProtocol: class {
    var presenter: TrainDetailsPresenterProtocol? { get set }
    
    func showTrainDetails(_ train: Train)
    func showError(_ message: String)
}

protocol TrainDetailsWireframeProtocol: class {
    static func createTrainDetailsModule(for train: Train) -> UIViewController
}

protocol TrainDetailsPresenterProtocol: class {
    var view: TrainDetailsViewProtocol? { get set }
    var interactor: TrainDetailsInteractorInputProtocol? { get set }
    var wireframe: TrainDetailsWireframeProtocol? { get set }
    var train: Train? { get set }
    
    func viewDidLoad()
}

protocol TrainDetailsInteractorOutputProtocol: class {
    func didRetrieveTrainDetails(_ trainStops: [TrainStop])
    func onError(_ message: String)
}

protocol TrainDetailsInteractorInputProtocol: class {
    weak var presenter: TrainDetailsInteractorOutputProtocol? { get set }
    var dataManager: TrainDetailsDataManagerInputProtocol? { get set }
    
    func retrieveTrainDetails(for code: String, and date: String)
}

protocol TrainDetailsDataManagerInputProtocol: class {
    func retrieveTrainDetails(forCode code: String, and date:String, onCompletion: @escaping (Bool, [TrainStop]) -> Void)
}

protocol TrainDetailsLocalDataManagerInputProtocol: class {
    func retrieveTrainDetails() throws -> [Train]
}
