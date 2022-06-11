//
//  Double+Extenion.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import Foundation

extension Double {
    var formattedHoundeds: String {
        return String(format: "$%.2f", self)
    }
}
