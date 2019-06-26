//
//  LocationUtility.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
import MapKit

class Locationutility {
    
    //Funzione che restituisce una distanza in metri tra due coordinate
    static func distanza(da: CLLocationCoordinate2D?, a: CLLocationCoordinate2D?) -> CLLocationDistance? {
        
        //Controllo se i dati sono validi
        guard let da = da, let a =  a else {
            //Condizione non valida
            return nil
        }
        guard controlloCoordinate(da), controlloCoordinate(a) else {
            //Condizioni non valide
            return nil
        }
        
        //Calcolo la disanza attraverso CLLocation
        let locationDa = CLLocation.init(latitude: da.latitude, longitude: da.longitude)
        let locationA =  CLLocation.init(latitude: a.latitude, longitude: a.longitude)
        
        return locationDa.distance(from: locationA)
    }
    
    //Avvia la naigazone con le mappe di sistema
    static func navigaVerso(evento: Evento?){
        
        //Controllo di avere le coordinate dell'evento
        guard let coordinate = evento?.coordinate, controlloCoordinate(coordinate) else {
            return
        }
        
        //Passo le coordinate alle mappe
        let placemark = MKPlacemark(coordinate:coordinate)
        
        let item = MKMapItem(placemark : placemark)
        item.name = evento?.nome
        
        item.openInMaps(launchOptions: nil)
    }
    //Restituisce true se le coordinate sono valide
    static func controlloCoordinate(_ coordinate: CLLocationCoordinate2D?) ->Bool {
        //Controllo se i dati sono validi
        guard let coordinate = coordinate else {
            //Condizione non valida
            return false
        }
        guard CLLocationCoordinate2DIsValid(coordinate) else {
            //Condizioni non valide
            return false
        }
        guard coordinate.latitude != 0.0, coordinate.longitude != 0.0 else {
            //Coordinate nell'oceano atlantico
            return false
        }
        return true
        
    }
    
    
}

