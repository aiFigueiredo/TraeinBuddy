//
//  Train.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct Train {
    let code: String
    let date: String
    let origin: String
    let originTime: String
    let destination: String
    let destinationTime: String
    let late: String
    let dueIn: Int
    let status: String
    let lastKnownLocation: String
    let type: String
    
    var stops = [TrainStop]()
}

extension Train {
    init(xmlObject: XML.Accessor.Element) {
        code = xmlObject["Traincode"].text ?? "N/A"
        date = xmlObject["Traindate"].text ?? "N/A"
        origin = xmlObject["Origin"].text ?? "N/A"
        originTime = xmlObject["Origintime"].text ?? "N/A"
        destination = xmlObject["Destination"].text ?? "N/A"
        destinationTime = xmlObject["Destinationtime"].text ?? "N/A"
        late = xmlObject["Late"].text ?? "N/A"
        status = xmlObject["Status"].text ?? "N/A"
        lastKnownLocation = xmlObject["Lastlocation"].text ?? "N/A"
        type = xmlObject["Traintype"].text ?? "N/A"
        dueIn = Int(xmlObject["Duein"].text ?? "0") ?? 0
    }
}
