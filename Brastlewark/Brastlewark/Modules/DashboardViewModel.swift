//
//  DashboardViewModel.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

class DashboardViewModel {

    // MARK: - Variables
    var arrayInhabitants: [Inhabitant] = []
    private let networkManager = NetworkService()

    // MARK: - Binding to view
    var reloadInfo: (() -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?

    // MARK: - Lifecycle
    init() {
    }

    // MARK: - Function
    func getSizeInhabitants() -> Int {
        return arrayInhabitants.count
    }

    func fetchInhabitants() {
        showLoader?()
        networkManager.makeRequest(
            for: .inhabitants,
            method: .get,
            completionSuccess: { dataInfo in
                self.hideLoader?()
                print("Success")
                // Set the info to the Array
                do {
                    let response = try JSONDecoder().decode(BrastlewarkModel.self, from: dataInfo)
                    self.arrayInhabitants = response.allInhabitants
                    self.reloadInfo?()
                } catch let error {
                    print("Can`t decode: \(error)")
                }
            }, completionError: {
                print("Error")
                // Bind some time if error to view
            })
    }

    func downloadThumbnail(path: String, completion: @escaping (Data?) -> Void) {
        networkManager.donwloadInfo(
            for: path,
            completionSuccess: { data in
                print("Success on View model")
                completion(data)
            }, completionError: {
                completion(nil)
                print("Error on view model")
            })
    }

}
