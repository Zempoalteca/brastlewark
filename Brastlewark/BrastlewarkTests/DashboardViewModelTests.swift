//
//  DashboardViewModelTests.swift
//  BrastlewarkTests
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import XCTest
@testable import Brastlewark

class DashboardViewModelTests: XCTestCase {

    // MARK: - Variables
    var viewModel: DashboardViewModel!
    var mockData = Data()

    override func setUpWithError() throws {

        viewModel = DashboardViewModel()
        mockData = Utils.dataFromBundle(
            type: self.classForCoder,
            forResource: "mock",
            withExtension: "json")

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Tests

    func testGetSizeInhabitants() {
        // given
        let model = DashMockClass()
        let inhabitantNumberExpected = 3

        // when (Action)
        model.fetchInhabitantsMock(mockData: mockData)
        let inhabitantNumber = model.getSizeInhabitants()

        // then (Comprobación)
        XCTAssertEqual(inhabitantNumber, inhabitantNumberExpected)
    }

    func testGetInahbitant_whenFetchInfoFinish_thenGetAnInhabitant() {
        // given
        let model = DashMockClass()
        let inhabitatnModelExpected = Inhabitant(
            idValue: 0,
            name: "Tobus Quickwhistle",
            thumbnail: "http://www.publicdomainpictures.net/pictures/10000/nahled/thinking-monkey-11282237747K8xB.jpg",
            ageInhabitant: 306,
            weight: 39.065952,
            height: 107.75835,
            hairColor: "Pink",
            professions: [
              "Metalworker",
              "Woodcarver",
              "Stonecarver",
              " Tinker",
              "Tailor",
              "Potter"
            ],
            friends: [
              "Cogwitz Chillwidget",
              "Tinadette Chillbuster"
            ],
            image: nil)

        // when
        model.fetchInhabitantsMock(mockData: mockData)
        let resultModel = model.getInhabitant(for: 0)

        // then
        XCTAssertEqual(inhabitatnModelExpected.idValue, resultModel.idValue)
    }

}

class DashMockClass: DashboardViewModel {

    func fetchInhabitantsMock(mockData: Data) {
        do {
            let response = try JSONDecoder().decode(BrastlewarkModel.self,
                                                    from: mockData)
            arrayInhabitants = response.allInhabitants
        } catch {
            arrayInhabitants = []
        }
    }

}
