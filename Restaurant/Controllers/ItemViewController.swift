//
//  ItemViewController.swift
//  Restaurant
//
//  Created by Gerodot on 6/7/22.
//

import UIKit

class ItemViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var detailsTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!

    // MARK: -Properties
    var menuItem: MenuItem!

    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - UI Methods
    func updateUI () {
        navigationItem.title = menuItem.name
        imageView.image = menuItem.image
        priceLabel.text = menuItem.formattedPrice
        detailsTextLabel.text = menuItem.detailText

        // UIImageView Style
        let cornerRadius: CGFloat = 10.0
        imageView.clipsToBounds = true
    }

    // MARK: -Actions
    @IBAction func addToOrderButton(_ sender: UIButton) {
    }

}
