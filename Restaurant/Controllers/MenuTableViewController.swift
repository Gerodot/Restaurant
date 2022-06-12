//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import UIKit

class MenuTableViewController: UITableViewController {

    // MARK: - Properites
    var networkManager = NetworkManager()
    var category: String!
    let cellManager = CellManager()
    var menuItems = [MenuItem]()

    // MARKL: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = category.localizedCapitalized

        networkManager.getMenuItems(for: category) { menuItems, error in
            guard let menuItems = menuItems else {
                print(#line, #function, "ERROR: ", terminator: "")
                if let error = error {
                    print(error)
                } else {
                    print("Can't get menu items fo category \(self.category ?? "nil")")
                }
                return
            }

            self.menuItems = menuItems
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
        segue.identifier == "ItemSegue",
            let destination = segue.destination as? ItemViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }

        destination.menuItem = menuItems[indexPath.row]
    }

    // MARK: - UITableVirwController
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let menuItem = menuItems[indexPath.row]
        cellManager.configure(cell, with: menuItem, for: tableView, indexPath: indexPath)
        return cell
    }
}
