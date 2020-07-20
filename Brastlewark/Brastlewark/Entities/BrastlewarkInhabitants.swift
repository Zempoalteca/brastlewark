//
//  BrastlewarkInhabitants.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

struct BrastlewarkModel: Codable {

    let allInhabitants: [Inhabitant]

    private enum CodingKeys: String, CodingKey {
        case allInhabitants = "Brastlewark"
    }

}
