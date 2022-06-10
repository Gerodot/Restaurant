//
//  MenuItem.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation
import UIKit

class MenuItem: Codable {
    let id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    var image: UIImage?

    init(
        id: Int,
        name: String,
        detailText: String,
        price: Double,
        category: String,
        imageURL: URL,
        image: UIImage? = nil
    ) {
        self.id = id
        self.name = name
        self.detailText = detailText
        self.price = price
        self.category = category
        self.imageURL = imageURL
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}

extension MenuItem {
    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }
}
