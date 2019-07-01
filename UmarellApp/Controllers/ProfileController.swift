//
//  ProfileController.swift
//  UmarellApp
//
//  Created by IED Student on 26/06/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class ProfileController: UIViewController{
    
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelCredito: UILabel!
    @IBOutlet weak var labelCitta: UILabel!
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelRegistratoDa: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        EditButton.layer.cornerRadius = EditButton.frame.size.height/2.0
        EditButton.layer.masksToBounds = true
        
        NetworkUtility.downloadImmagine(indirizzoWeb: "http://ied.apptoyou.it/app/avatars/default.jpg", perImageView: profileImage)
        labelNome.text = LoginUtility.utenteConnesso?.nome
        // labelRegistratoDa.text = LoginUtility.utenteConnesso?.timestamp
        
        labelCredito.text = LoginUtility.utenteConnesso?.email
        
        
        //labelCredito.text = stringCredito
        
        // labelCitta.text = LoginUtility.utenteConnesso?.citta
        // labelData.text = LoginUtility.utenteConnesso?.dataDiNascita
        
        
        
        
    }
    
    
    
}
