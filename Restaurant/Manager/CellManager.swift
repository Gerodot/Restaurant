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
}
