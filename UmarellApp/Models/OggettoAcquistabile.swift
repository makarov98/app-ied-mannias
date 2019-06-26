//
//  OggettoAcquistabile.swift
//  Balistreri
//
//  Created by IED Student on 13/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class OggettoAcquistabile: Comparable {
    static func < (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        return (lhs.id  ?? 0) < (rhs.id ?? 0)
    }
    
    static func == (lhs: OggettoAcquistabile, rhs: OggettoAcquistabile) -> Bool {
        //Confronto i nomi degli oggetti nel carrello
        return lhs.nome == rhs.nome
    }
    
    
    var id:Int?
    var nome:String?
    var quantità:Int?
    var prezzo:Double?
    var immagineUrl: String?
}
