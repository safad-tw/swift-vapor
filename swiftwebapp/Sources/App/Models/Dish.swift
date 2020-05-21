//
//  Dish.swift
//  App
//
//  Created by Mohammad Safad on 5/11/20.
//

import Foundation
import Vapor
import FluentSQLite

final class Dish: Content {
    var id: Int?
    var title: String
    var desc: String
    var price: Double
    var course: String
    var imageURL: String
    
    init(title: String,desc: String, price: Double, course: String, imageURL: String ) {
        self.title = title
        self.desc = desc
        self.price = price
        self.course = course
        self.imageURL = imageURL
    }
}

extension Dish:SQLiteModel {
    static let entity: String = "dishes"
}

extension Dish: Migration { }
extension Dish: Parameter { }
