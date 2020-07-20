//
//  DetailInhabitantViewModelTests.swift
//  BrastlewarkTests
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import XCTest
@testable import Brastlewark

class DetailInhabitantViewModelTests: XCTestCase {

    override func setUpWithError() throws {

    }

    func testSomenthing() {
        // given
        let viewModel = DetailInhabitantViewModelMock()

        // when
        viewModel.fetchImageMock(name: "mockImage")
        let imageResult = viewModel.thumbnailImage

        // then
        XCTAssertNotNil(imageResult)
    }

    override func tearDownWithError() throws {

    }

}

class DetailInhabitantViewModelMock: DetaitInhabitantViewModel {

    func fetchImageMock(name: String) {
        let bundle = Bundle(for: DetailInhabitantViewModelTests.self)
        thumbnailImage = UIImage(named: name,
                                 in: bundle,
                                 compatibleWith: nil)
    }

}
