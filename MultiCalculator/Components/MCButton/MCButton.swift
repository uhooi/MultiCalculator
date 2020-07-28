//
//  MCButton.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/26.
//

import UIKit

class MCButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.darkGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(.systemBackground, for: .normal)
        self.titleLabel?.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .bold))
        self.backgroundColor = .darkGray
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = rect.height / 2
    }
}
