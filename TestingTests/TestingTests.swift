//
//  TestingTests.swift
//  TestingTests
//
//  Created by Maksim Azarskov on 02.11.2023.
//
@testable import Testing
import XCTest


final class TestingTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    }
    func testAddition() throws {
        let calc = Calculator()
        calc.calcBuffer(2)
        calc.addition()
        calc.calcBuffer(2)
        let result = calc.equal()
        XCTAssert(result == 4, "The number should be 4. But was: \(result)")
    }
    func testSubtraction() throws {
        let calc = Calculator()
        calc.calcBuffer(5)
        calc.subtraction()
        calc.calcBuffer(3)
        let result = calc.equal()
        XCTAssert(result == 2, "The number should be 2. But was: \(result)")
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
       measure {
            // Put the code you want to measure the time of here.
       }
    }

}
