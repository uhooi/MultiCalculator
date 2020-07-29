//
//  MultiCalculatorPresenter.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import Foundation

protocol MultiCalculatorPresentation: class {
    func viewDidLoad()
    func orientationDidChanged(isPortrait: Bool)
}

class MultiCalculatorPresenter: Injectable {
    struct Dependency {
        let view: MultiCalculatorViewable
    }
    
    private weak var view: MultiCalculatorViewable?
    
    required init(dependency: Dependency) {
        self.view = dependency.view
    }
}

extension MultiCalculatorPresenter: MultiCalculatorPresentation {
    func viewDidLoad() {
        
    }
    
    func orientationDidChanged(isPortrait: Bool) {
        let dependencies: [Void] = isPortrait
            ? [()]
            : [(), (), ()]
        view?.containerDependenciesDidChange(dependencies)
    }
}
