//
//  TestingUITests.swift
//  TestingUITests
//
//  Created by Maksim Azarskov on 02.11.2023.
//
@testable import Testing
import XCTest

final class TestingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdditionUI() throws {
        // UI tests must launch the application that they test.
        /*
        let calc = Calculator()
        let app = XCUIApplication()
        let button = app.buttons["3.circle.fill"]
        button.tap()
        app.buttons["Add"].tap()
        button.tap()
        app.buttons["equal.circle.fill"].tap()
        */
    
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
