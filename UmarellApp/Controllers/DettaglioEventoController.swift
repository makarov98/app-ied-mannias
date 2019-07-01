//
//  DettaglioEventoController.swift
//  Balistreri
//
//  Created by IED Student on 28/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
import MapKit //<-- Per usare CLLocation

class DettaglioEventoController:
    UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    //L'evento da rappresentare su questa schermata
    var evento: Evento?
    
    //La posizione dell'evento connesso
    var miaPosizione: CLLocation?
    
    //Mark: - Outlets
    @IBOutlet weak var immagineCopertina: UIImageView!
    @IBOutlet weak var carrelloButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prezzoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var luogoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelDistanza: UILabel!
    @IBOutlet weak var labelMeteo: UILabel!
    @IBOutlet weak var buttonMappa: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        carrelloButton.layer.cornerRadius = carrelloButton.frame.size.height/2.0
        carrelloButton.layer.masksToBounds = true
        
        
        //Metto i contenuti dell'evento sui componenti della schermata
        if let eventoDaRappresentare = evento {
            setupConEvento(eventoDaRappresentare)
        }
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        //UI
        buttonMappa.setTitle(" ", for: .normal)
    }
    
    //Questa funzione si occupa di prendere tutte le informazioni dal modello "Evento" e metterle su ogni elemento grafico della cella
    func setupConEvento(_ evento: Evento) {
        //Metto nome evento
        nameLabel.text = evento.nome
        descriptionLabel.text = evento.descrizione
        luogoLabel.text = evento.indirizzo
        
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            prezzoLabel.text = String(format: "%.2f € l'ora", prezzo)
        } else {
            prezzoLabel.text = "Gratis"
        }
        
        
        
        //Metto l'immagine dell'evento
        NetworkUtility.downloadImmagine(indirizzoWeb: evento.copertinaUrl, perImageView: immagineCopertina)
        
        let data = DateUtility.stringa(conData: evento.data, formato: "dd/MM/yyyy")
        dataLabel.text = data
        
        if let distanza = Locationutility.distanza(da: evento.coordinate, a: miaPosizione?.coordinate){
            // Scrivo la distanza sulla label
            let distanzaInKm = distanza / 1000.0
            let stringaDistanza = String(format: "%.1f", distanzaInKm)
            labelDistanza.text = "L'evento è distante \(stringaDistanza) Km da te"
        }else{
            labelDistanza.isHidden = true
        }
        
        //Metto la tempertura
        labelMeteo.text =  " "
        
        Network.richiestaMeteoEvento(evento) {
            //Questa parte di codice viene eseguita solo quando  viene ricevuot il meteo dal server
            (meteo) in
            //Metto i dati ricevuti su schermo
            if let temperatura = meteo?.temperatura{
                if let descrizione = meteo?.descrizione{
                    
                    self.labelMeteo.text = "\(temperatura) C - \(descrizione) "
                }
            }
        }
        
        // Metto il pin della mappa
        
        
        //Creo il pin
        let pin = PinMappa.init(conEvento : evento)
        
        //Lo aggiungo alla mappa
        mapView.addAnnotation(pin)
        
        // Centro la mappa sul pin
        if let coordinate = evento.coordinate{
            let camera = mapView.camera
            camera.centerCoordinate = coordinate
            camera.altitude = 500
            //mapView.setCamera(<#T##camera: MKMapCamera##MKMapCamera#>, animated: false)
            
        }
        mapView.showsUserLocation = true
        // mapView.showUserLocation = true
        
        
        
        
        
    }
    
    // Mark: - CollectionView delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return evento?.oggettiAcquistabili?.count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cella = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOggettoAcquistabile", for: indexPath) as! CellOggettoAcquistabile
        
        let oggetto = evento?.oggettiAcquistabili?[indexPath.item]
        
        // cella.setupConOggettoAcquistabile(oggetto)
        
        return cella
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Prendo l'oggetto dagli oggetti acquistabili
        guard let oggetto = evento?.oggettiAcquistabili?[indexPath.item] else {
            return
        }
        
        chiediConfermaAcquisto(oggetto: oggetto)
    }
    
    
    func chiediConfermaAcquisto(oggetto: OggettoAcquistabile?){
        //Controllo validità dati
        guard let oggetto = oggetto else {
            return
        }
        
        //1.Mostriamo l'alert di conferma
        
        AlertUtility.mostraAlertDiConferma(conTitolo: "Vuoi aggiungere l'evento al carrello?", messaggio: oggetto.nome, viewController: self) { (sceltaUtente) in
            if sceltaUtente{
                //L'utente ha scelto si
                //Locationutility.navigaVerso(evento: self.evento)
                CartUtility.aggiungiAlCarrello(oggetto)
            }
        }
        
        //2. Se l'utente accetta lo aggiungiamo al carrello
    }
    
    // Mark: - CollectionView Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Altezza pari al totale disponible
        let altezza = collectionView.frame.size.height
        //Larghezza pari a 70% del totale disponibile
        let larghezzaTot = collectionView.frame.width
        let larghezza = larghezzaTot * 0.7
        
        return CGSize(width: larghezza, height: altezza)
        
    }
    
    
    
    
    
    // Mark: - Actions
    @IBAction func navigaVerso(_ sender: Any) {
        
        AlertUtility.mostraAlertDiConferma(conTitolo: "Vuoi navigare verso l'evento?", messaggio: evento?.indirizzo, viewController: self) { (sceltaUtente) in
            if sceltaUtente{
                //L'utente ha scelto si
                Locationutility.navigaVerso(evento: self.evento)
            }
        }
    }
    @IBAction func aggiungiAlCarrello(_ sender: Any) {
        // chiediConfermaAcquisto(oggetto: evento)
    }
}
