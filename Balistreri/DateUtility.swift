//
//  DateUtility.swift
//  Balistreri
//
//  Created by IED Student on 06/05/2019.
//  Copyright © 2019 IED. All rights reserved.
//

import UIKit

class DateUtility {
    
    static func stringa(conData data: Date?, formato: String?) -> String? {
        
        guard let data = data, let formato = formato else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.string(from: data)
        
    }
    
    static func data(conStringa stringa: String?, formato: String?) -> Date? {
        
        guard let stringa = stringa, let formato = formato else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = formato
        return formatter.date(from: stringa)
    }
}
