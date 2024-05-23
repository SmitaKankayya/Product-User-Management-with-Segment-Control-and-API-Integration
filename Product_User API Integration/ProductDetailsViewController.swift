//
//  ProductDetailsViewController.swift
//  Product_User API Integration
//
//  Created by Smita Kankayya on 23/05/24.
//

import UIKit
import Kingfisher
class ProductDetailsViewController: UIViewController {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    var productContainer : ProductData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.kf.setImage(with: URL(string: productContainer!.image))
        self.titleLabel.text = ("Title : \(productContainer!.title)")
        self.priceLabel.text = ("Price : \(productContainer!.price)")
        self.descriptionLabel.text = ("Description : \(productContainer!.description)")
        self.categoryLabel.text = ("Category : \(productContainer!.category)")
        
        
    }
}
