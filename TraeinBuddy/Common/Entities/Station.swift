//
//  Station.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 31/03/2018.
//  Copyright © 2018 José Miguel Figueiredo. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct Station {
    let id: Int
    let code: String
    let name: String
    let latitude: Float?
    let longitude: Float?
}

extension Station {
    init(xmlObject: XML.Accessor.Element) {
        var text: String
        
        if
            let alias = xmlObject["StationAlias"].text,
            alias.count > 0 {
            if
                let description = xmlObject["StationDesc"].text,
                description.count > 0 {
                text = description
            } else {
                text = alias
            }
        } else {
            if
                let description = xmlObject["StationDesc"].text,
                description.count > 0 {
                text = description
            } else {
                text = "Information Unavailable"
            }
        }
        
        name = text
        latitude = Float(xmlObject["StationLatitude"].text ?? "")
        longitude = Float(xmlObject["StationLongitude"].text ?? "")
        code = xmlObject["StationCode"].text ?? "N/A"
        id = Int(xmlObject["StationId"].text ?? "") ?? 0
    }
}
