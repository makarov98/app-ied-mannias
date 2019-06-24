//
//  HomeController.swift
//  Balistreri
//
//  Created by ieduser on 08/04/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// La lista degli eventi da disegnare sulla TableView
    var listaEventi: [Evento] = []
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Setup della schermata
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Questo serve per comunicare con la TableView:
        tableView.delegate = self
        tableView.dataSource = self
        
        creaEventiDiProva()
    }
    
    func creaEventiDiProva() {
        // Creo un evento di prova
        let uno = Evento()
        uno.nome = "Lezione App Design"
        uno.indirizzo = "Via Alcamo 11, Roma, Italia"
        uno.data = DateUtility.data(conStringa: "01/04/2018", formato: "dd/MM/yyyy")
        uno.prezzo = 55.0
        uno.copertinaUrl = "https://images.unsplash.com/photo-1509732057623-c8a63eb59dd7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
        
        // Lo aggiungo alla lista
        listaEventi.append(uno)
    }
    
    
    // MARK: - TableView delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // In questa funzione l'HomeController comunica alla TableView il numero di righe che deve disegnare
        return listaEventi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // In questa funzione l'HomeController comunica alla TableView COME deve disegnare ogni riga (con quale UI, con quali dati, ecc...)
        let cella = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! CellEvento
        
        let evento = listaEventi[indexPath.row]
        cella.setupConEvento(evento)
        
        return cella
    }
    
}
