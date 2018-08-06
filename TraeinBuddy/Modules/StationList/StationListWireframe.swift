//
//  StationListWireframe.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import UIKit

class StationListWireframe: StationListWireframeProtocol {
    
    class func createStationListModule() -> UIViewController {
        let view = StationListViewController()
        let presenter: StationListPresenterProtocol & StationListInteractorOutputProtocol = StationListPresenter()
        let interactor: StationListInteractorInputProtocol = StationListInteractor()
        let dataManager: StationListDataManagerInputProtocol = StationListDataManager()
        let wireframe: StationListWireframeProtocol = StationListWireframe()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        return view
    }
    
    func presentStationDetailScreen(from view: StationListViewProtocol, for station: Station) {
        let trainListVC = TrainListWireframe.createTrainListModule(for: station)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(trainListVC, animated: true)
        }
    }
}
