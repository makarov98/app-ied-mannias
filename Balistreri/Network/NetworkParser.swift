//
//  NetworkParser.swift
//  Balistreri
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
    
    class NetworkParser {
        
        static func parserMeteo(conData data: IEDDictionary) -> Meteo? {
            
            let meteo = meteo()
            
            if let main = data["main"] as? IEDDictionary {
                meteo.temperatura = main["temp"] as? Double
            }
            
            if let weather = data["weather"] as? IEDArray {
                if let firstWeather = weather.first as? IEDDictionary {
                    meteo.descrizione = firstWeather["description"] as? String
                }
            }
        }
        
        return meteo
    }
}
