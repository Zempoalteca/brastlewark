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
    func fetchImage(path: String) {
        showLoader?()
        networkManager.donwloadInfo(
            for: path,
            completionSuccess: { data in
                self.hideLoader?()
                print("Success on View model")
                self.setImage?(data)
            }, completionError: {
                self.hideLoader?()
                self.setImage?(nil)
                print("Error on view model")
            })
    }

}
