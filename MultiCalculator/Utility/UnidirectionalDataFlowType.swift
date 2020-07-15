//
//  UnidirectionalDataFlowType.swift
//  Template
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType

    func apply(_ input: InputType)
}
