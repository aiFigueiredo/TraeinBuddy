//
//  Constants.swift
//  TraeinBuddy
//
//  Created by Jose Miguel Figueredo on 06/08/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        static let stationListURL = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML"
        static let trainListURL = "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode="
        static let trainDetailURL = "http://api.irishrail.ie/realtime/realtime.asmx/getTrainMovementsXML?TrainId="
        static let trainDetailQueryURL = "&TrainDate="
    }
    
    struct APIKeys {
        static let stationXMLPrimaryKey = "ArrayOfObjStation"
        static let stationXMLSecondaryKey = "objStation"
        
        static let trainXMLPrimaryKey = "ArrayOfObjStationData"
        static let trainXMLSecondaryKey = "objStationData"
        
        static let trainDetailXMLPrimaryKey = "ArrayOfObjTrainMovements"
        static let trainDetailXMLSecondaryKey = "objTrainMovements"
    }
}
