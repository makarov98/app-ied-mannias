//
//  Network.swift
//  Balistreri
//
//  Created by IED Student on 10/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class Network {
    
    static func richiestaMeteoRoma() {
        
        let url = "http://ied.apptoyou.it/app/meteoroma.php"
        
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: nil) {
            
            (risposta) in
            
            if risposta.success {
                
                // Controllo se i dati ricevuti sono del tipo che mi aspettavo
                if temperatura = risposta.data as? Int {
                    
                    print("La temperatura a Roma è di \(temperatura) °C")
                }
            }
        }
        
        static func ripostaDelServerArrivata(_ risposta: Any) {
            // Code
        }
        
    }
    
    typealias CompletitionMeteo = ((Meteo?) -> Void)
    
    static func richiestaMeteoEvento(_ evento: Evento?) {
        
        // Check validità dei dati
        guard let coordinate = evento?.coordinate else {
            // Dati non validi
            return
        }
        
        let url = "https://api.openweathermap.org/data/2.5/weather"
        
        // Parametri da passare al servizio
        var parametri = IEDDictionary()
        parametri["appid"] = "7854e283b3c65ba9943d850e002019b4"
        parametri["units"] = "metric"
        parametri["lang"] = "it"
        
        parametri["lat"] = coordinate.latitude
        parametri["lon"] = coordinate.longitude
        
        // Richiamiamo il srvizio
        IEDNetworking.jsonGet(url: url, authToken: nil, parameters: parametri) {
            
            (risposta) in
            
            if risposta.success {
                
                if let dictionary = risposta.data as? IEDDictionary {
                    //Parse della risposta
                    let meteo = NetworkParser.parserMeteo(conData: dictionary)
                    
                    print("La temperatura è: \(meteo?.temperatura ?? 0)")
                    print("La descrizione è: \(meteo?.descrizione ?? "")")
                }
                
            }
            
        }
    }
}
