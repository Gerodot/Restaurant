//
//  CellManager.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation
import UIKit
 
class CellManager {
    let networkManager = NetworkManager()
    
    func configure(_ cell: UITableViewCell, with category: String) {
        cell.textLabel?.text = category.localizedCapitalized
    }

    func configure(
        _ cell: UITableViewCell,
        with menuItem: MenuItem,
        for tableView: UITableView? = nil,
        indexPath: IndexPath
    ) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
       
        guard cell.imageView?.image == nil else { return }
        networkManager.getImage(menuItem.imageURL) { image, error in
            if let error = error {
                print(#line, #function, error.localizedDescription)
            }
            DispatchQueue.main.async {
                cell.imageView?.image = image
                tableView?.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
