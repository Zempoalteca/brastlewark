//
//  BrastlewarkUITests.swift
//  BrastlewarkUITests
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import XCTest

class BrastlewarkUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation -
        // required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launch()
    }

    func testOpenInhabitantDetails_whenTapOverColletionViewCell_thenShowInhabitantDetails() throws {
        XCUIApplication()
            .collectionViews
            .children(matching: .cell)
            .element(boundBy: 5)
            .children(matching: .other)
            .element.children(matching: .other)
            .element
            .tap()
    }

    func testBackToDashboardFromDetails_whenTapBackNavigationBarButton_thenShowsDashboardView() {
        let app = XCUIApplication()
        app.collectionViews
            .children(matching: .cell)
            .element(boundBy: 0)
            .children(matching: .other)
            .element
            .children(matching: .other)
            .element
            .tap()
        app.navigationBars["Brastlewark"]
            .buttons["Brastlewark"]
            .tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
