//
//  MultiCalculatorViewControllerTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/31.
//

import XCTest
@testable import MultiCalculator

class MultiCalculatorViewControllerTests: XCTestCase {
    func createViewController() -> MultiCalculatorViewController {
        let viewController = MultiCalculatorViewController(dependency: ())
        viewController.viewDidLoad()
        return viewController
    }
    
    func testViewDidLoad() {
        let viewController = createViewController()
        
        XCTAssertEqual(viewController.view.backgroundColor, UIColor.label)
    }
    
    func testContainerView() {
        let viewController = createViewController()
        
        XCTAssertEqual(viewController.containerView.distribution, UIStackView.Distribution.fillEqually)
    }
}
