//
//  Order.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import Foundation

struct Order {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
