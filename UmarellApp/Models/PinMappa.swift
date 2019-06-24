//
//  PinMappa.swift
//  Balistreri
//
//  Created by IED Student on 28/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
import MapKit

class PinMappa: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate = CLLocationCoordinate2D()
    
    var eventoAssociato: Evento?
    
    convenience init(conEvento evento: Evento) {
        self.init()
        
        eventoAssociato = evento
        
        title = evento.nome
        subtitle = evento.indirizzo
        
        if let coordinateEvento = evento.coordinate{
            coordinate = coordinateEvento
        }
    }
}
