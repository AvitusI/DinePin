//
//  Restaurant.swift
//  FoodPin
//
//  Created by MacMini on 23/03/2025.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isFavorite: Bool
    
    init(name: String, type: String, location: String, image: String, isFavorite: Bool, phone: String, description: String) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
    }
    
    init () {
        self.init(name: "", type: "", location: "", image: "", isFavorite: false, phone: "", description: "")
    }
}
