//
//  StationListDataManager.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import Alamofire
import SwiftyXMLParser

class StationListDataManager : StationListDataManagerInputProtocol {
    func retrieveStationList(onCompletion:@escaping (Bool, [Station]) -> Void) {
        Alamofire
            .request(Constants.API.stationListURL, parameters: nil)
            .response { response in
                if let data = response.data {
                    if response.error == nil {
                        var dataArray = [Station]()
                        let xml = XML.parse(data)

                        for element in xml[Constants.APIKeys.stationXMLPrimaryKey,
                                           Constants.APIKeys.stationXMLSecondaryKey] {
                            dataArray.append(Station(xmlObject: element))
                        }

                        onCompletion(true, dataArray.sorted { $0.name < $1.name })
                        return
                    }
                }
                onCompletion(false, [Station]())
        }
    }
}
