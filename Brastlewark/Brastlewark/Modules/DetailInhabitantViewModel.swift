//
//  DetailInhabitantViewModel.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

class DetaitInhabitantViewModel {

    // MARK: - Variables

    private let networkManager = NetworkService()

    // MARK: - Binding to view

    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    var setImage: ((Data?) -> Void)?

    // MARK: - Lifecycle

    init() {
    }

    // MARK: - Functions

    /// Donwload the image data for the given url as string
    /// - Parameter path: Location URL of Image as String
    func fetchImage(path: String) {
        showLoader?()
        networkManager.donwloadInfo(
            for: path,
            completionSuccess: { data in
                self.hideLoader?()
                self.setImage?(data)
            }, completionError: {
                self.hideLoader?()
                self.setImage?(nil)
            })
    }

}
