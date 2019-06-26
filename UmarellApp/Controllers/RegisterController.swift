//
//  RegisterController.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    
    @IBOutlet weak var buttonCreate: UIButton!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var confermPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textEmail.layer.cornerRadius = textEmail.frame.size.height/2.0
        textEmail.layer.masksToBounds = true
        
        textPassword.layer.cornerRadius = textPassword.frame.size.height/2.0
        textPassword.layer.masksToBounds = true
        
        confermPassword.layer.cornerRadius = confermPassword.frame.size.height/2.0
        confermPassword.layer.masksToBounds = true
        
        buttonCreate.layer.cornerRadius = buttonCreate.frame.size.height/2.0
        buttonCreate.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonCreate(_ sender: Any) {
        if (textEmail.text != nil){
            print("ok")
            if (textPassword.text != nil){
                print("ok")
                if (confermPassword.text == textPassword.text){
                    print("ok")
                } else {
                    print("ERRORE")
                }
            } else{
                print("ERRORE")
            }
        } else {
            print("Errore")
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

