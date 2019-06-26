//
//  LoginController.swift
//  Balistreri
//
//  Created by ieduser on 01/04/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Outlet
    
    
    @IBOutlet weak var textEmail: UITextField!
    
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var accediButton: UIButton!
    
    override func viewDidLoad() {           // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        textEmail.layer.cornerRadius = textEmail.frame.size.height/2.0
        textEmail.layer.masksToBounds = true
        
        textPassword.layer.cornerRadius = textPassword.frame.size.height / 2.0
        textPassword.layer.masksToBounds = true
        
        accediButton.layer.cornerRadius = accediButton.frame.size.height / 2.0
        accediButton.layer.masksToBounds = true
    }
    
    // Mark :- Funzioni
    private func controllaValiditaDatiInseriti() -> Bool {
        
        //Controllo il campo delle email
        if textEmail.text == nil || textEmail.text == ""{
            AlertUtility.mostraAler(titolo: "Login errato", messaggio: "Le credenziali inserite sono sbagliate", viewController: self)
            return false
        }
        
        //Controllo il campo della password
        if textPassword.text == nil || textPassword.text == ""{
            AlertUtility.mostraAler(titolo: "Login errato", messaggio: "Le credenziali inserite sono sbagliate", viewController: self)
            return false
        }
        //Tutto ok
        return true
    }
    
    
    // MARK : - Action
    
    @IBAction func buttonAccedi(_ sender: Any) {
        
        guard controllaValiditaDatiInseriti() else {
            //Dati non validi
            return
        }
        Network.richiestaLogin(conEmail: textEmail.text, password: textPassword.text) {
            (utente) in
            
            if let utente = utente{
                //Login riuscito
                print("Login riuscito")
                
                //Salvo in memoria l'utente appena ricevuto dal server
                LoginUtility.utenteConnesso = utente
                
                //Vado alla home
                self.performSegue(withIdentifier: "vaiAllaHome", sender: self)
                
            } else {
                AlertUtility.mostraAler(titolo: "Login errato", messaggio: "Le credenziali inserite sono sbagliate", viewController: self)
            }
        }
        print("Dati validi")
    }
    
}
