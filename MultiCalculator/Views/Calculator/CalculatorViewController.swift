//
//  CalculatorViewController.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/26.
//

import UIKit

class CalculatorViewController: UIViewController, Injectable {
    
    typealias Dependency = Void
    
    var count: Int = 100 {
        didSet {
            resultLabel.text = "\(count)"
        }
    }
    
    @IBOutlet var resultLabel: UILabel! {
        willSet {
            newValue.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 68, weight: .light))
            newValue.textColor = .systemBackground
            newValue.textAlignment = .right
            newValue.adjustsFontSizeToFitWidth = true
            newValue.adjustsFontForContentSizeCategory = true
            newValue.text = "\(count)"
        }
    }
    @IBOutlet var stackViews: [UIStackView]!
    
    @IBAction func tappedNumber(_ sender: MCButton) {
        guard let title = sender.titleLabel?.text else { return }
        guard let number = Int(title) else { return }
        count += number
    }
    
    required init(dependency: Dependency) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .label
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChanged),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
        stackViews.forEach({
            let buttons = $0.subviews
                .compactMap { $0 as? MCButton }
            buttons.forEach({
                $0.layoutIfNeeded()
            })
        })
    }
    
    @objc func orientationDidChanged() {
        let orientation = UIDevice.current.orientation
        print("isLandscape: \(orientation.isLandscape)")
        print("isPortrait: \(orientation.isPortrait)")
        
        resultLabel.font = orientation.isPortrait
            ? UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 68, weight: .light))
            : UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 48, weight: .light))
        
        stackViews.forEach({
            $0.spacing = orientation.isPortrait ? 20 : 4
            let buttons = $0.subviews as? [MCButton]
            buttons?.forEach({ button in
                button.titleLabel?.font = orientation.isPortrait
                    ? UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 28, weight: .bold))
                    : UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .bold))
            })
        })
    }
}
