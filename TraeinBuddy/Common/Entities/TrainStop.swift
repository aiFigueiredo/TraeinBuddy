//
//  TrainStops.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 01/04/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation
import SwiftyXMLParser

enum TrainStopType: String {
    case none = ""
    case current = "C"
    case next = "N"
}

struct TrainStop {
    let locationCode: String
    let locationName: String
    let locationOrder: Int
    let locationType: String
    let type: TrainStopType
}

extension TrainStop {
    init(xmlObject: XML.Accessor.Element) {
        locationCode = xmlObject["LocationCode"].text ?? "N/A"
        locationName = xmlObject["LocationFullName"].text ?? "N/A"
        locationOrder = Int(xmlObject["LocationOrder"].text ?? "") ?? 0
        locationType = xmlObject["LocationType"].text ?? "N/A"
        type = TrainStopType(rawValue: xmlObject["StopType"].text ?? "") ?? .none
    }
}
