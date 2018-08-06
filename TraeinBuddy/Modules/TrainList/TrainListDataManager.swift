//
//  TrainListDataManager.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Alamofire
import SwiftyXMLParser

class TrainListDataManager: TrainListDataManagerInputProtocol {
    func retrieveTrainList(forCode code: String, onCompletion: @escaping (Bool, [Train]) -> Void) {
        Alamofire
            .request("\(Constants.API.trainListURL)\(code)", parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        var dataArray = [Train]()
                        let xml = XML.parse(data)

                        for element in xml[Constants.APIKeys.trainXMLPrimaryKey,
                                           Constants.APIKeys.trainXMLSecondaryKey] {
                            dataArray.append(Train(xmlObject: element))
                        }

                        onCompletion(true, dataArray.sorted { $0.dueIn < $1.dueIn })
                        return
                    }
                }
                onCompletion(false, [])
        }
    }
}
