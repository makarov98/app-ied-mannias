//
//  CellEvento.swift
//  Balistreri
//
//  Created by ieduser on 08/04/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class CellEvento : UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelIndirizzo: UILabel!
    
    @IBOutlet weak var labelPrezzo: UILabel!
    
    @IBOutlet weak var imageCopertina: UIImageView!
    
    
    // MARK: - Setup della cella
    
    /// Questa funzione si occupa di prendere tutte le informazioni dal modello "Evento" e metterle su ogni elemento grafico della cella (Outlets)
    func setupConEvento(_ evento: Evento) {
        
        // Metto il nome dell'evento
        labelNome.text = evento.nome
        
        // Metto l'indirizzo dell'evento
        labelIndirizzo.text = evento.indirizzo
        
        // Metto il prezzo dell'evento
        if let prezzo = evento.prezzo, prezzo > 0.0 {
            labelPrezzo.text = String(format: "%.2f € l'ora", prezzo)
        } else {
            // Nessun prezzo specificato
            labelPrezzo.text = "Gratis"
        }
    }
    
}
