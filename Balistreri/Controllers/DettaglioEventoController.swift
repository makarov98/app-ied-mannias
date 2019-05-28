//
//  DettaglioEventoController.swift
//  Balistreri
//
//  Created by IED Student on 28/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class DettaglioEventoController: UIViewController {
    var evento: Evento?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let eventoDaRappresentare = evento {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> CGSize {
        let altezza = collectionView.frame.size.height
        
        let larghezzaTotale = collectionView.frame.size.width
        let larghezza = larghezzaTotale * 0.7
        
        return CGSize(width: larghezza, height: altezza)
    }
}
