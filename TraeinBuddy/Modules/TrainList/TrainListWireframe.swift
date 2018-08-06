//
//  TrainListWireframe.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

class TrainListWireframe: TrainListWireframeProtocol {
    
    static func createTrainListModule(for station: Station) -> UIViewController {
        let view = TrainListViewController()
        let presenter: TrainListPresenterProtocol & TrainListInteractorOutputProtocol = TrainListPresenter()
        let interactor: TrainListInteractorInputProtocol = TrainListInteractor()
        let dataManager: TrainListDataManagerInputProtocol = TrainListDataManager()
        let wireframe: TrainListWireframeProtocol = TrainListWireframe()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.station = station
        
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        return view
    }
    
    func presentTrainPickerScreen(from view: TrainListViewProtocol, for train: Train) {
        let trainDetailsVc = TrainDetailsWireframe.createTrainDetailsModule(for: train)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(trainDetailsVc, animated: true)
        }
    }
    
}
