//
//  OrderManager.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import Foundation

class OrderManager {
    static let orderUpdateNotification = Notification.Name("OrderManager.orderUpdeted")
    
    static var shared = OrderManager()
    
    private init() {}
    
    var order = Order() {
        didSet {
            NotificationCenter.default.post(name: OrderManager.orderUpdateNotification, object: nil)
        }
    }
    
}
