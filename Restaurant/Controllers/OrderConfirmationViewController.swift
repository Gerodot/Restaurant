//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Gerodot on 6/11/22.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    
    @IBOutlet var timeRemaningLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeRemaningLabel.text = "Thank you for your order!/n Your waiting timae is approximately \(minutes!) minutes"
        // Do any additional setup after loading the view.
    }
}
