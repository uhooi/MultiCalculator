//
//  UIBarButtonItem+EmptyTitle.swift
//  Template
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createBackBarButtonItemForEmptyTitle() -> UIBarButtonItem {
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = " "
        return backBarButtonItem
    }
}
