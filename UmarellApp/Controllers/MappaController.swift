//
//  MappaController.swift
//  Balistreri
//
//  Created by IED Student on 27/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

import MapKit

class MappaControllerViewController: UIViewController, MKMapViewDelegate {
    
    let manager = CLLocationManager()
    
    //Mark
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buttonCentraPosizioneUtente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Cambio titolo pagina
        navigationItem.title = "Mappa Eventi"
        
        //Chiedo autorizzazione per trovare posizione
        manager.requestWhenInUseAuthorization()
        
        //Mostro lamia  posizione sulla mappa
        mapView.showsUserLocation = true
        
        //Diventoo delegate della mp view
        mapView.delegate = self
        
        //Aggiungo i pin sulla mappa
        for evento in Database.eventi{
            //Creo il pin
            let pin = PinMappa.init(conEvento : evento)
            
            //Lo aggiungo alla mappa
            mapView.addAnnotation(pin)
            
        }
        //UI
        UIUtility.arrotondaAngoliCercho(buttonCentraPosizioneUtente)
    }
    
    //Mark: - Map View delegate
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //Controllo se è stato aggiunto un oggetto PinMappa
        if let pin = view.annotation as? PinMappa {
            //Prendo l'evento rappresentato dal pin
            if let eventoSelezionato = pin.eventoAssociato {
                
                //Calcolo la distanza dell'evento dalla mia posizione
                if let miaPosizione = mapView.userLocation.location{
                    
                    //Prendo la posizione dell'evento selezionato
                    let latitudine = eventoSelezionato.coordinate?.latitude ?? 0.0
                    let longitudine = eventoSelezionato.coordinate?.longitude ?? 0.0
                    
                    let posizioneEvento = CLLocation.init(latitude: latitudine, longitude: longitudine)
                    
                    //Calcolo la distanza attraverso la classe CLLocation
                    let distanzaInMetri = miaPosizione.distance(from: posizioneEvento)
                    let distanzaInKm = distanzaInMetri / 1000.0
                    let stringaDistanza = String.init(format: "%.1f", distanzaInKm)
                    
                    print (" Distanza dell'evento: \(stringaDistanza) Km")
                    
                }
                
                //Creo la prossima schermata di dettaglio dell'evento
                
                //1. Prendo un riferimento allo storyboard dove risiede il view controller
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                
                //2. Instanzio il view controller attraverso il suo identifier
                let viewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
                
                //3. Passo l'evento selezionato al view controller
                if let dettaglioController = viewController as? DettaglioEventoController{
                    dettaglioController.evento = eventoSelezionato
                    
                    //3.a - Passo anche la posizione dell'utente
                    dettaglioController.miaPosizione = mapView.userLocation.location
                }
                
                //4. Apro il view controller in questione
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func buttonCentraPosizioneUtente(_ sender: Any) {
        //Prendo le coordinate dell'utente chiedendole alla mappa
        let coordinate = mapView.userLocation.coordinate
        
        //Controllo che siano valide
        if CLLocationCoordinate2DIsValid(coordinate){
            
            //Controllo se non siamo nell'oceano atlantico
            if coordinate.latitude != 0.0, coordinate.longitude != 0.0 {
                //Centro la mappa
                mapView.setCenter(coordinate, animated: true)
            } else {
                //Lancio una richiesta di soccorso
            }
        }
    }
    
}
