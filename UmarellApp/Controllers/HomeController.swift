//
//  HomeController.swift
//  Balistreri
//
//  Created by ieduser on 08/04/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Lista degli eventi da disegnare nella tabella
    var listaEventi :[Evento] = []
    
    // MARK
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Set up schermata
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Cambio il titolo della schermata
        navigationItem.title = "Lista eventi"
        
        
        
        //Metto in comunicazione la table view
        tableView.delegate = self
        tableView.dataSource = self
        
        listaEventi = Database.eventi
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        aggiornaPulsanteCarrello()
        
    }
    
    // MARK : - Funzioni
    func aggiornaPulsanteCarrello(){
        //Aggiungo/aggiorno il pulsante per il carrello
        let buttonCarrello = UIBarButtonItem.init(image: CartUtility.iconaCarrello(), style: .plain, target: self, action: #selector(apriCarrello))
        navigationItem.rightBarButtonItem = buttonCarrello
    }
    
    @objc func apriCarrello(){
        
        //Instanzio lo storyboard del viewcontroller
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        //Instanzio il viewcontroller del carrello
        let viewController = storyboard.instantiateViewController(withIdentifier: "CartController")
        
        //Creo un navigation controller per avere la barra superiore
        let navigationController = UINavigationController.init(rootViewController: viewController)
        
        //Presento il viewController come "modale"
        present(navigationController, animated: true)
        
    }
    
    
    
    // MARK : - Table view delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //In questa funzione l?homeController comunica all aTable view il numero di rghe da disegnare
        return listaEventi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //In questa funzione l?homeController comunica all aTable view come disegare ogni riga(dati , ui,ecc..)
        let cella = tableView.dequeueReusableCell(withIdentifier: "CellEvento") as! CellEvento
        
        let evento = listaEventi[indexPath.row]
        cella.setupConEvento(evento)
        
        
        return cella
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Recupero l'evento associato alla cella selezionata dall'utente
        
        let eventoSelezionato = listaEventi[indexPath.row]
        
        //Creo la prossima schermata di dettaglio dell'evento
        
        //1. Prendo un riferimento allo storyboard dove risiede il view controller
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        //2. Instanzio il view controller attraverso il suo identifier
        let viewController = storyboard.instantiateViewController(withIdentifier: "DettaglioEventoController")
        
        //3. Passo l'evento selezionato al view controller
        if let dettaglioController = viewController as? DettaglioEventoController{
            dettaglioController.evento = eventoSelezionato
        }
        
        //4. Apro il view controller in questione
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
