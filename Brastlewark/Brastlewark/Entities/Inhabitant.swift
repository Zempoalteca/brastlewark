//
//  Inhabitant.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

struct Inhabitant: Codable {

    let idValue: Int
    let name: String
    let thumbnail: String
    let ageInhabitant: Int
    let weight: Double
    let height: Double
    let hairColor: String
    let professions: [String]
    let friends: [String]
    var image: Data?

    private enum CodingKeys: String, CodingKey {
        case idValue        = "id"
        case name
        case thumbnail
        case ageInhabitant  = "age"
        case weight
        case height
        case hairColor      = "hair_color"
        case professions
        case friends
    }

}
