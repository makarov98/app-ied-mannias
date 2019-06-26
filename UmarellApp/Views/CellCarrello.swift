//
//  CellCarrello.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class CellCarrello: UITableViewCell {
    
    //Mark: - Outlets
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelTipo: UILabel!
    
    //Mark: - Setup
    
    func setupConOggettoAcquistabile(_ oggetto: OggettoAcquistabile?){
        labelNome.text = oggetto?.nome
        
        if (oggetto is Evento){
            labelTipo.text = "Evento"
        } else if (oggetto is OggettoAcquistabile){
            labelTipo.text = "Oggetto acquistabile"
        }
    }
}
