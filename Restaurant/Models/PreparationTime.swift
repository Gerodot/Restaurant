//
//  PreparationTime.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import Foundation

struct PreparationTime: Codable {
    let prepTime: Int

    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
