//
//  MultiCalculatorRouter.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import UIKit

protocol MultiCalculatorWireframe {
    
}

class MultiCalculatorRouter {
    static func assembleModules() -> UIViewController {
        let view = MultiCalculatorViewController(dependency: ())
        let dependency = MultiCalculatorPresenter.Dependency(view: view)
        view.presenter = MultiCalculatorPresenter(dependency: dependency)
        return view
    }
}
