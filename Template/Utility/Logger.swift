//
//  Logger.swift
//  Template
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import Foundation

class Logger {
    static func debug(_ body: Any? = nil, filepath: String = #file, functionName: String = #function, line: Int = #line) {
        let functionName = functionName
        let filename = filepath.components(separatedBy: "/").last ?? ""
        #if DEBUG
        print("[\(filename)🔹\(functionName) : \(line)] ✅ \(body ?? "")")
        #endif
    }
    static func warning(_ body: Any? = nil, filepath: String = #file, functionName: String = #function, line: Int = #line) {
        let functionName = functionName
        let filename = filepath.components(separatedBy: "/").last ?? ""
        #if DEBUG
        print("[\(filename)🔹\(functionName) : \(line)] ⚠️ \(body ?? "")")
        #endif
    }
    static func error(_ body: Any? = nil, filepath: String = #file, functionName: String = #function, line: Int = #line) {
        let functionName = functionName
        let filename = filepath.components(separatedBy: "/").last ?? ""
        #if DEBUG
        print("[\(filename)🔹\(functionName) : \(line)] ❌ \(body ?? "")")
        #endif
    }
}
