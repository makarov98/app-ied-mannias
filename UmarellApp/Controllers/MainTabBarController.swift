//
//  MainTabBarController.swift
//  Balistreri
//
//  Created by IED Student on 20/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prendo i TabBat Items che compongono l'app
        if let tabBarItems = tabBar.items{
            let dimensioneIcone = CGSize(width: 30.0, height: 30.0)
            //Home
            if tabBarItems.count > 0 {
                let itemHome = tabBarItems[0]
                
                itemHome.title = "Home"
                let image = UIImage(named: "home (1)")
                itemHome.image = UIUtility.resizeImage(image,targetSize: dimensioneIcone)
            }
            if tabBarItems.count > 1 {
                let itemMap = tabBarItems[1]
                
                itemMap.title = "Map"
                let image = UIImage(named: "placeholder")
                itemMap.image = UIUtility.resizeImage(image,targetSize: dimensioneIcone)
            }
            if tabBarItems.count > 2 {
                let itemMap = tabBarItems[2]
                
                itemMap.title = "Profile"
                let image = UIImage(named: "user")
                itemMap.image = UIUtility.resizeImage(image,targetSize: dimensioneIcone)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }

}
