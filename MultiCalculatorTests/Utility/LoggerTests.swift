//
//  LoggerTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/30.
//

import XCTest
@testable import MultiCalculator

class LoggerTests: XCTestCase {
    func testLogger() {
        
        Logger.debug()
        Logger.warning()
        Logger.error()
    }
}
