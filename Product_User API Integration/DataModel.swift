//
//  DataModel.swift
//  MachineTest
//
//  Created by Smita Kankayya on 18/05/24.
//

import Foundation

struct Users : Decodable {
    
    let address: Address
    let username: String
    let email : String
    let name : Name
    
    }

struct Address: Decodable {
    
    let geolocation: Geolocation
    let city: String
    let street: String
    let number: Int
    let zipcode: String
    
    }

struct Geolocation: Decodable {
    
    let lat: String
    let long: String
    
    }

struct Name: Decodable {
    
    let firstname: String
    let lastname: String
    
}

struct ProductData: Decodable {
   
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
    
}





