//
//  DateUtility.swift
//  Balistreri
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class DateUtility : NSObject {
    
    //Funzione converte un oggetto di tipo data in una sctringa
    static func stringa(conData data: Date?, formato : String?)-> String? {
        //Controllo se i valori passati sono validi
        guard let data = data, let formato = formato else{
            return nil
        }
        //Converto l'oggetto di tipo "Date" in una stringa
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.string(from: data)
    }
    //Funzione che converte una stringa in una data
    static func data(conStringa stringa : String?, formato: String?)-> Date? {
        //Controllo che i valori passati come parametri siano validi
        guard let stringa = stringa, let formato = formato else{
            return nil
        }
        //Converto l'oggetto di tipo string in un adata
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.date(from: stringa)
    }
}

