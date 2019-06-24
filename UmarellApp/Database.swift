//
//  Database.swift
//  Balistreri
//
//  Created by IED Student on 27/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
import MapKit

class Database {
    // lista eventi raggiungibili in qualsiasi punto dell'app
    static var eventi:[Evento] = []
    
    static func creaEventiDiProva() {
        let uno = Evento()
        uno.nome = "Lezione App Design"
        uno.descrizione = "Adoroh"
        uno.indirizzo = "Via Alcamo 11, Rome, Italia"
        uno.data = Date()
        uno.prezzo = 55
        uno.copertinaUrl = "https://images.unsplash.com/photo-1489001606409-a7fd2655b8da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
        
        // assegno le coordinate
        uno.coordinate = CLLocationCoordinate2D.init(latitude: 41.8864837, longitude: 12.523872)
        
        // creo un oggetto acquistabile di prova
        let acquistabileUno = OggettoAcquistabile()
        acquistabileUno.nome = "Maglia"
        acquistabileUno.quantita = 1
        acquistabileUno.prezzo = 10
        acquistabileUno.immagineUrl = "https://images.unsplash.com/photo-1508963493744-76fce69379c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
        
        uno.oggettiAcquistabili = [acquistabileUno]
        
        //lo aggiungiamo agli oggetti acquistabili
        uno.oggettiAcquistabili = [acquistabileUno, acquistabileDue]
        
        //lo aggiungiamo alla lista
        eventi.append(uno)
        
        let due = Evento()
        due.nome = "Voragine a San Giovanni"
        due.indirizzo = "Via Leopardi 10, CB, Italia"
        due.data = Date()
        due.prezzo = 55.0
        due.copertinaUrl = "https://images.unsplash.com/photo-1465493251445-c6af8fc40b7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80"
        
        // assegno le coordinate
        due.coordinate = CLLocationCoordinate2D.init(latitude: 45.8864837, longitude: 23.523872)
        
        //lo aggiungiamo alla lista
        eventi.append(due)
        
        let tre = Evento()
        tre.nome = "Albero Caduto a San Marco"
        tre.indirizzo = "Corso Vittorio, CB, Italia"
        tre.data = Date()
        tre.prezzo = 55.0
        tre.copertinaUrl = "https://images.unsplash.com/photo-1465493251445-c6af8fc40b7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80"
        
        // assegno le coordinate
        tre.coordinate = CLLocationCoordinate2D.init(latitude: 41.8864837, longitude: 12.523872)
        
        //lo aggiungiamo alla lista
        eventi.append(tre)
    }
}
