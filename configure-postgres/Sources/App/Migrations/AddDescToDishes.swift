//
//  AddDescToDishes.swift
//  App
//
//  Created by Mohammad Safad on 5/18/20.
//

import Foundation
import Vapor
import FluentPostgreSQL

class AddingDescToDB: Migration {
    
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(Dish.self, on: conn) { (builder) in
            builder.field(for: \.description)
        }
    }
    
    static func revert(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(Dish.self, on: conn) { (builder) in
            builder.deleteField(for: \.description)
        }
    }
    
    
    
    
}
