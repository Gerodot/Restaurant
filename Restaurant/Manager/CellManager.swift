//
//  CellManager.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation
import UIKit
 
class CellManager {
    func configure(_ cell: UITableViewCell, with category: String) {
        cell.textLabel?.text = category.localizedCapitalized
    }

    func configure(_ cell: UITableViewCell, with menuItem: MenuItem) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
    }
}
