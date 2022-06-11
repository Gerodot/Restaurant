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
        cell.detailTextLabel?.text = menuItem.price.formattedHoundeds

        guard cell.imageView?.image == nil else { return }

        if let image = menuItem.image {
            cell.imageView?.image = image
        } else {
            networkManager.getImage(menuItem.imageURL) { image, error in
                if let error = error {
                    print(#line, #function, error.localizedDescription)
                }
                if let image = image {
                    menuItem.image = image
                    DispatchQueue.main.async {
                        tableView?.reloadRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
    }
}
