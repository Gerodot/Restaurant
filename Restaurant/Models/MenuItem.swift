//
//  MenuItem.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation

struct MenuItem: Codable {
    let id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}
