//
//  MainTabBarController.swift
//  Balistreri
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        
        //Modifico il tint color
        tabBar.tintColor = UIColor.red
        
        //Prendo i "TabBarItem" che compongono l'app
        if let tabBarItems = tabBar.items {
            
        //Dimensione massima per le icone degli items
            if let tabBarItems = tabBar.items {
                
                let dimensioneIcone = CGSize(width: 30.0, height: 30.0)
                //Home
                if tabBarItems.count >= 1 {
                
                let itemHome = tabBarItems[0]
                
                itemHome.title = "Home"
                }
                
                //Mappa
                if tabBarItems.count >= 1 {
                //Prendo il tabBarItem
                let itemHome = tabBarItems[1]
                
                //Cambio il titolo
                itemHome.title = "Mappa"
                }
                //Cambio l'icona
                let image = UIImage (named: "calendar")
                itemHome.image = UIUtility.resizedImage(image,targetSize: dimensioneIcone)
            }
        }
    }
}
