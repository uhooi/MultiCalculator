//
//  RootViewController.swift
//  Template
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, Injectable {
    struct Dependency {
        let rootViewController: UIViewController
    }
    
    private var currentViewController: UIViewController
    
    required init(dependency: Dependency) {
        self.currentViewController = dependency.rootViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(currentViewController)
        view.addSubview(currentViewController.view)
        currentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            currentViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        currentViewController.didMove(toParent: self)
    }
}
