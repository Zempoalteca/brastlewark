//
//  NetworkAPI.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

class NetworkAPI {

    // MARK: - Public Functions
    static func getURL(for endpoint: Endpoint) -> URL? {
        let urlObject = URLComponents(
            string: getBaseURL(for: endpoint) +
                getPath() +
                endpoint.rawValue)
        guard let urlComponents = urlObject else {
            print("Can't create the url component.")
            return nil
        }
        return urlComponents.url
    }

    // MARK: - Private function
    private static func getBaseURL(for endpoint: Endpoint) -> String {
        return "https://raw.githubusercontent.com"
    }

    private static func getPath() -> String {
        return "/rrafols/mobile_test/master/"
    }

}

enum Endpoint: String {

    // API
    case inhabitants = "data.json"

}
