//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import UIKit

class MenuTableViewController: UITableViewController {

    // MARK: - Properites
    var cellManager = CellManager()
    var categories = [String]()
    let networkManager = NetworkManager()

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getCategories { categories, error in
            guard let categories = categories else {
                if let error = error {
                    print(#line, #function, "ERROR:", error.localizedDescription)
                } else {
                    print(#line, #function, "ERROR: Can't load categories")
                }
                return
            }

            self.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "ItemSegue",
            let categoryIndex = tableView.indexPathForSelectedRow
        else { return }
        let desitnation = segue.destination as! ItemTableViewController
        desitnation.category = categories[categoryIndex.row]
    }
    
    // MARK: - UITableViewSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cellManager.configure(cell, with: categories[indexPath.row])
        return cell
    }
}
