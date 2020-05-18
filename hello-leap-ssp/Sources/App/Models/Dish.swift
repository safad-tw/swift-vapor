//
//  Dish.swift
//  App
//
//  Created by Mohammad Safad on 5/18/20.
//

import Foundation
import Vapor
import FluentPostgreSQL

final class Dish: Content{
    
    var id: Int?
    var name: String
    var course: String
    var price: String
    var imageURL: String
    var description: String
    
    
    init(name: String, price: String, course: String,imageURL: String, description: String) {
        self.name = name
        self.price = price
        self.course = course
        self.imageURL = imageURL
        self.description = description
    }
}

extension Dish: PostgreSQLModel{
    static var entity: String = "Dishes"
    
}

extension Dish: Migration{}
extension Dish: Parameter{}


