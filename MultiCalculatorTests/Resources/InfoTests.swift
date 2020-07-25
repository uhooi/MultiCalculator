//
//  InfoTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/25.
//

import XCTest

class InfoTests: XCTestCase {
    func testAdHoc() {
        let path = Bundle.main.path(forResource: "AdHoc", ofType: "plist")
        XCTAssertNotNil(path)
    }
    
    func testDebug() {
        let path = Bundle.main.path(forResource: "Debug", ofType: "plist")
        XCTAssertNotNil(path)
    }
    
    func testRelease() {
        let path = Bundle.main.path(forResource: "Release", ofType: "plist")
        XCTAssertNotNil(path)
    }
}
