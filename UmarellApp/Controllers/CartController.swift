//
//  CartController.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Mark : - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelCart: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        //Aggiungo il pulsante di chiusura
        let chiudi = UIBarButtonItem.init(title: "Chiudi", style: .plain, target: self, action: #selector(buttonChiudi))
        navigationItem.rightBarButtonItem=chiudi
        
        setupController()
    }
    
    func setupController(){
        //Configurazione della schermata
        
        //Titolo
        if CartUtility.carrello.count>0{
            let numeroArticoli = CartUtility.carrello.count
            navigationItem.title = "Carrello"
        } else {
            //Carrello vuoto
            navigationItem.title = "Carrello"
            
        }
        
        //Messagio "nessun articolo nel carrello"
        if CartUtility.carrello.count > 0{
            labelCart.isHidden = true
        } else {
            labelCart.isHidden = false
        }
    }
    
    //MArk: functions
    
    @objc func buttonChiudi(){
        dismiss(animated: true)
    }
    
    // Mark: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartUtility.carrello.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellCarrello") as! CellCarrello
        
        //Prendo l'oggetto da rappresenyare sulla cella
        let oggetto = CartUtility.carrello[indexPath.row]
        cell.setupConOggettoAcquistabile(oggetto)
        
        return cell
    }
    
    // Mark: Editing delle celle tableView
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //Questa funzione viene richiamata quando l'utente cambia la modalità di "editing" di una cela, tramite lo "swipe-to-delete"
        if editingStyle == .delete{
            //Cancello l'oggetto dal carrello
            
            //Prendo l'oggetto da cancelare
            let oggetto = CartUtility.carrello[indexPath.row]
            CartUtility.rimuoviDalCarrello(oggetto)
            
            //Aggiorno la schermata
            setupController()
            
            //Ricarico la tableView
            tableView.reloadData()
        }
    }
    
    
}
