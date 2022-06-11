//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    // MARK: - Constants
    let cellManager = CellManager()
    
    // MARK: - Stored Properities
    var order = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - UITableVIewSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OederCell", for: indexPath)
        let menuItem = order.menuItems[indexPath.row]
        cellManager.configure(cell, with: menuItem, for: tableView, indexPath: indexPath)
        return cell
    }
}
