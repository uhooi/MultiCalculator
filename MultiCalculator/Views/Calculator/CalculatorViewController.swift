//
//  CalculatorViewController.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/26.
//

import UIKit

class CalculatorViewController: UIViewController, Injectable {
    
    struct Dependency {
        let isPortrait: Bool
    }
    
    private let dependency: Dependency
    private var userIsInTheMiddleOfTyping = false
    var brain = CalculatorBrainService()
    var displayNumber = "" {
        didSet {
            resultLabel.text = displayNumber
        }
    }
    
    @IBOutlet var resultLabel: UILabel! {
        willSet {
            newValue.font = dependency.isPortrait
                ? UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 68, weight: .light))
                : UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 48, weight: .light))
            newValue.textColor = .systemBackground
            newValue.textAlignment = .right
            newValue.adjustsFontSizeToFitWidth = true
            newValue.adjustsFontForContentSizeCategory = true
            newValue.text = "0"
        }
    }
    @IBOutlet var stackViews: [UIStackView]!
    
    required init(dependency: Dependency) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .label
        
        stackViews.forEach({
            $0.spacing = dependency.isPortrait ? 20 : 4
            $0.subviews
                .compactMap({ $0 as? MCButton })
                .forEach({ button in
                    button.titleLabel?.font = dependency.isPortrait
                        ? UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 28, weight: .bold))
                        : UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14, weight: .bold))
                })
        })
    }
    
    @IBAction func tappedNumber(_ sender: MCButton) {
        guard let symbol = sender.titleLabel?.text else { return }
        calculator(symbol)
    }
    
    func calculator(_ symbol: String) {
        if Int(symbol) != nil {
            touchDigit(symbol)
        } else {
            performOperation(symbol)
        }
    }
    
    private func touchDigit(_ digit: String) {
        if userIsInTheMiddleOfTyping {
            displayNumber += digit
        } else {
            displayNumber = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private func performOperation(_ symbol: String) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(Double(displayNumber)!)
            userIsInTheMiddleOfTyping = false
        }
        
        brain.performOperation(symbol)
        
        if let result = brain.result {
            displayNumber = String(result)
        }
    }
}
