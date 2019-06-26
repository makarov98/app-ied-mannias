//
//  SplashController.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Popolo il Database
        Database.creaEventiDiProva()
        Network.richiestaMeteoRoma()
        
        if (LoginUtility.utenteConnesso == nil){
            //Nesun utente connesso
            //vado pagina login
            performSegue(withIdentifier: "vaiAlLogin", sender: self)
        } else {
            //Utente connesso
            //Vado alla home
            performSegue(withIdentifier: "vaiAllaHome", sender: self)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Controllare se l'utente è connesso
        
    }
    
}

