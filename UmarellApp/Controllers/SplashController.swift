//
//  SplashController.swift
//  UmarellApp
//
//  Created by IED Student on 27/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class SplashController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Database.creaEventiDiProva()
        
        // Controllo se c'è un utente connesso
        if LoginUtility.utenteConnesso == nil {
            // Nessun utente connesso
            // Vado alla pagina di Login
            performSegue(withIdentifier: "VaiAllaLogin", sender: self)
        }
        else {
            // Utente connesso
            // Vado alla pagina Home
            performSegue(withIdentifier: "VaiAllaHome", sender: self)
        }
    }
    
}
