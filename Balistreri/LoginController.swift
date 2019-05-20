//
//  LoginController.swift
//  Balistreri
//
//  Created by ieduser on 01/04/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class LoginController : UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonAccedi: UIButton!
    
    
    // MARK: - Setup della schermata
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Arrotondamento angoli text email
        textEmail.layer.cornerRadius = textEmail.frame.size.height / 2.0
        textEmail.layer.masksToBounds = true
        
        // Bordo text email
        textEmail.layer.borderWidth = 1.0
        textEmail.layer.borderColor = UIColor.black.cgColor
        
        // Arrotondamento angoli text password
        // (circolare e dinamico in base all'altezza)
        textPassword.layer.cornerRadius = textPassword.frame.size.height / 2.0
        textPassword.layer.masksToBounds = true
        
    }
    
    
    // MARK: - Actions

    @IBAction func buttonAccedi(_ sender: Any) {
        
        // Controllo se la mail è giusta
        if textEmail.text == "ciao@gmail.com" {
            
            // Controllo se la password è giusta
            if textPassword.text == "password" {
                
                // OK
                print("Accesso eseguito!")
                
                performSegue(withIdentifier: "VaiAllaHome", sender: self)
            }
        }
    }
    
}
