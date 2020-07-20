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

    static func dataFromBundle(type: AnyClass,
                               forResource: String,
                               withExtension: String) -> Data {

        let bundle = Bundle(for: type)
        if let jsonString = bundle.url(
            forResource: forResource, withExtension: withExtension) {
            do {
                return try Data(contentsOf: jsonString)
            } catch {
                return Data()
            }
        }
        return Data()
    }

}
