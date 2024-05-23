//
//  ViewController.swift
//  Product_User API Integration
//
//  Created by Smita Kankayya on 21/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var productCollectionView: UIView!
    @IBOutlet var userTableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.addTarget(self, action: #selector(switchViewAction(_:)), for: .valueChanged)
        updateView()
    }
    
    @objc func switchViewAction(_ sender: UISegmentedControl) {
        updateView()
    }
    
    func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            productCollectionView.isHidden = false
            userTableView.isHidden = true
        } else {
            productCollectionView.isHidden = true
            userTableView.isHidden = false
        }
    }
    
}


