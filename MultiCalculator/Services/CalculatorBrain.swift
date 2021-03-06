//
//  CalculatorBrain.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import Foundation

struct PendingBinaryOperation {
    let function: (Double, Double) -> Double
    let firstOperand: Double
    
    func perform(with secondOperand: Double) -> Double {
        return function(firstOperand, secondOperand)
    }
}

struct CalculatorBrainService {
    
    private(set) var accumulator: Double?
    private(set) var pendingBinaryOperation: PendingBinaryOperation?
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double, Double) -> Double)
        case equals
        case clear
    }
    
    var operations: Dictionary<String, Operation> = [
        "AC" : Operation.clear,
        "%": Operation.unary({ $0 * 0.01 }),
        "±" : Operation.unary({ -$0 }),
        "×" : Operation.binary({ $0 * $1 }),
        "÷" : Operation.binary({ $0 / $1 }),
        "+" : Operation.binary({ $0 + $1 }),
        "−" : Operation.binary({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        guard let operation = operations[symbol] else {
            Logger.error("wrong operation symbol")
            return
        }
        switch operation {
        case .constant(let value):
            accumulator = value
        case .unary(let f):
            guard let accumulator = accumulator else { return }
            self.accumulator = f(accumulator)
        case .binary(let f):
            guard let accumulator = accumulator else { return }
            self.pendingBinaryOperation = .init(function: f, firstOperand: accumulator)
            self.accumulator = nil
        case .equals:
            if pendingBinaryOperation != nil, let accumulator = accumulator {
                self.accumulator = pendingBinaryOperation?.perform(with: accumulator)
                pendingBinaryOperation = nil
            }
        case .clear:
            self.accumulator = 0
            self.pendingBinaryOperation = nil
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
}
