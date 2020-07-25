//
//  UIBarButtonItem+EmptyTitleTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/25.
//

import XCTest
@testable import MultiCalculator

class UIBarButtonItem_EmptyTitleTests: XCTestCase {
    func testEmptyTitle() {
        let barButtonItem = UIBarButtonItem.createBackBarButtonItemForEmptyTitle()
        
        XCTAssertEqual(barButtonItem.title, " ")
    }
}
