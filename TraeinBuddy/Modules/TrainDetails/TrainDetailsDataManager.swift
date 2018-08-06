//
//  TrainDetailsDataManager.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Alamofire
import SwiftyXMLParser

class TrainDetailsDataManager: TrainDetailsDataManagerInputProtocol {
    func retrieveTrainDetails(forCode code: String, and date:String, onCompletion: @escaping (Bool, [TrainStop]) -> Void) {
        Alamofire
            .request("\(Constants.API.trainDetailURL)\(code.trimmingCharacters(in: .whitespaces))\(Constants.API.trainDetailQueryURL)\(String(describing: date.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!))", parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        var dataArray = [TrainStop]()
                        let xml = XML.parse(data)

                        for element in xml[Constants.APIKeys.trainDetailXMLPrimaryKey,
                                           Constants.APIKeys.trainDetailXMLSecondaryKey] {
                            dataArray.append(TrainStop(xmlObject: element))
                        }

                        onCompletion(true, dataArray.sorted { $0.locationOrder < $1.locationOrder })
                        return
                    }
                }
                onCompletion(false, [])
        }
    }
}
