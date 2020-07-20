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

    /// Return the number of elements into the inhabitants array
    /// - Returns: The count array
    func getSizeInhabitants() -> Int {
        return arrayInhabitants.count
    }

    /// Get the specific inhabitant model
    /// - Parameter index: position of inhabitant request into array
    /// - Returns: The inhabitant model
    func getInhabitant(for index: Int) -> Inhabitant {
        return arrayInhabitants[index]
    }

    /// Fetch the list of info for Brastlewark inhabitants
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

    /// Update data image thumbnail into the specific inhabitant model
    /// - Parameters:
    ///   - data: thumbail previously compressed
    ///   - index: position of model into array
    func updateImage(_ data: Data?, for index: Int) {
        arrayInhabitants[index].image = data
    }

    /// Compress image quality to 10 percent and returns as data
    /// - Parameter data: image as data
    /// - Returns: Thumbail as data compressed
    func compressImage(data: Data?) -> Data? {
        return data?.resizeImageData(compressionQuality: 0.1)
    }

    /// Downloads thumbnail image for given position inhabitant
    /// - Parameters:
    ///   - index: position of element into array to donwloas
    ///   - completion: Completion to returns the compressed image
    func downloadThumbnail(for index: Int, completion: @escaping (Data?) -> Void) {
        let path = arrayInhabitants[index].thumbnail
        networkManager.donwloadInfo(
            for: path,
            completionSuccess: { dataImage in
                let thumbnailData = self.compressImage(data: dataImage)
                self.updateImage(thumbnailData, for: index)
                completion(thumbnailData)
            }, completionError: {
                completion(nil)
            })
    }

}
