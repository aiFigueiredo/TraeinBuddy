//
//  TrainDetailsWireframe.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//


import UIKit

class TrainDetailsWireframe: TrainDetailsWireframeProtocol {
    class func createTrainDetailsModule(for train: Train) -> UIViewController {
        let view = TrainDetailsViewController()
        let presenter: TrainDetailsPresenterProtocol & TrainDetailsInteractorOutputProtocol = TrainDetailsPresenter()
        let interactor: TrainDetailsInteractorInputProtocol = TrainDetailsInteractor()
        let dataManager: TrainDetailsDataManagerInputProtocol = TrainDetailsDataManager()
        let wireframe: TrainDetailsWireframeProtocol = TrainDetailsWireframe()

        view.presenter = presenter
        view.title = "\(train.type) - \(train.code)"
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.train = train

        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        return view
    }
}
