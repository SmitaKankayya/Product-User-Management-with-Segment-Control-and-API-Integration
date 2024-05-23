//
//  ProductsViewController.swift
//  Product_User API Integration
//
//  Created by Smita Kankayya on 21/05/24.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet var productCollectionView: UICollectionView!
    
    var productCollectionViewCell : ProductCollectionViewCell?
    var products : [ProductData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCollectionView()
        registerXIBWithCV()
        jsonParsingUsingDecoder()
        
    }
    
    func registerXIBWithCV(){
        let uiNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        productCollectionView.self.register(uiNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
    }
    
    func initializeCollectionView(){
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        
    }
    
    func jsonParsingUsingDecoder(){
        let url = URL(string: "https://fakestoreapi.com/products")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            self.products = try! jsonDecoder.decode([ProductData].self, from: data!)
            print(self.products)
            
            DispatchQueue.main.async{
                self.productCollectionView.reloadData()
            }
        }
        dataTask.resume()
    }
    
}

//MARK : UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCollectionViewCell = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell
        productCollectionViewCell!.layer.borderWidth = 1
        productCollectionViewCell!.layer.borderColor = UIColor.black.cgColor
        productCollectionViewCell?.productImage.kf.setImage(with: URL(string: products[indexPath.row].image ))
        productCollectionViewCell?.title.text = ("Title : \(String(describing: products[indexPath.row].title))")
        productCollectionViewCell?.price.text = ("Price : \(String(describing: products[indexPath.row].price))")
        return productCollectionViewCell!
    }
    
}

//MARK : UICollectionViewDelegate
extension ProductsViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        productDetailsViewController?.productContainer = products[indexPath.row]
        navigationController?.pushViewController(productDetailsViewController!, animated: true)
    }
}

//MARK : UICollectionViewDelegateFlowLayout
extension ProductsViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 150)
        
    }
}






