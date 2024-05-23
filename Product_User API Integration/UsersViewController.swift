//
//  UsersViewController.swift
//  Product_User API Integration
//
//  Created by Smita Kankayya on 21/05/24.
//

import UIKit

class UsersViewController: UIViewController {
    @IBOutlet var userTableView: UITableView!
    
    var user : [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIBWithTableView()
        initializeTableView()
        JsonDecoder()
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: "UsersTableViewCell", bundle: nil)
        self.userTableView.register(uiNib, forCellReuseIdentifier: "UsersTableViewCell")
    }
    
    func initializeTableView(){
        userTableView.dataSource = self
        userTableView.delegate = self
    }
    
    func JsonDecoder(){
        let url = URL(string: "https://fakestoreapi.com/users")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            self.user = try! jsonDecoder.decode([Users].self, from: data!)
            
            print(self.user)
            
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
        dataTask.resume()
    }
}

//MARK : UITableViewDataSource
extension UsersViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.userTableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as? UsersTableViewCell
        tableViewCell!.layer.borderWidth = 1
        tableViewCell!.layer.borderColor = UIColor.black.cgColor
        tableViewCell?.firstName.text = ("FirstName : \(user[indexPath.row].name.firstname)")
        tableViewCell?.lastName.text = ("LastName : \(user[indexPath.row].name.lastname)")
        tableViewCell?.userName.text = ("UserName : \(user[indexPath.row].username)")
        return tableViewCell!
    }
}

//MARK : UITableViewDelegate
extension UsersViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let usersDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "UsersDetailsViewController") as? UsersDetailsViewController
        usersDetailsViewController?.userContainer = user[indexPath.row]
        
        navigationController?.pushViewController(usersDetailsViewController!, animated: true)
    }
    
}

