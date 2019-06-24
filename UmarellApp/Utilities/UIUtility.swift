//
//  UIUtility.swift
//  Balistreri
//
//  Created by IED Student on 27/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit
class UIUtility {
    static func resizeImage(_image: UIImage?, targetSize: CGSize) -> UIImage {
        
        // controllo se l'immagine passata esiste
        guard let image = _image_image else {
            return nil
        }
    }
    
    let size = image.size
    
    let widthRatio = targetSize.width / size.width
    let heightRatio = targetSize.height / size.height
    
    var newSize: CGSize
    
    if widthRatio > heightRatio {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    UIGraphicsBeginImageContexWithOptions(newSize, false 0,0)
    image.draw(in: rect)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

    static func arrotondaAngoloCerchio(_view: UIView) {
        _view_view.layer.cornerRadius = _view.frame.size.height / 2.0
        _view.layer.masksToBounds = true
    }
}
