//
//  UsersDetailsViewController.swift
//  Product_User API Integration
//
//  Created by Smita Kankayya on 23/05/24.
//

import UIKit

class UsersDetailsViewController: UIViewController {
    
    
    @IBOutlet var latLabel: UILabel!
    @IBOutlet var longLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var streetLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var zipcodeLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var userContainer : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
    }
    
    func bindData(){
        
        self.latLabel.text = userContainer?.address.geolocation.lat
        self.longLabel.text = userContainer?.address.geolocation.long
        self.cityLabel.text = userContainer?.address.city
        self.streetLabel.text = userContainer?.address.street
        self.numberLabel.text = "\(userContainer?.address.number ?? 0)"
        self.zipcodeLabel.text = userContainer?.address.zipcode
        self.emailLabel.text = userContainer?.email
        
    }
}

