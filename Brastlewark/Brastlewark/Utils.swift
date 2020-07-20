//
//  Utils.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

class Utils {

    static var nameApp: String {
        get {
            if let infoDictionary = Bundle.main.infoDictionary,
                let name = infoDictionary["CFBundleName"] as? String {
                return name
            }
            return "Brastlewark"
        }
    }

}
