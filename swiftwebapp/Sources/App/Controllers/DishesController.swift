//
//  DishesController.swift
//  App
//
//  Created by Mohammad Safad on 5/16/20.
//

import Foundation
import Vapor
import FluentSQLite

class DishesController: RouteCollection {
    func boot(router: Router) throws {
        
        let groupedDishes = router.grouped("api/dishes")
        
        groupedDishes.get("/", use: get)
        groupedDishes.get(Dish.parameter, use: getDishById)
        groupedDishes.delete(Dish.parameter, use: deleteDish)
        groupedDishes.get("courses", String.parameter, use: getDishByTitle)
        groupedDishes.post(Dish.self,at: "/", use: createDish)
        
    }

    func get(req: Request) -> Future<[Dish]> {
        return Dish.query(on: req).all()
    }
    
    func deleteDish(req: Request) -> Future<Dish> {
         return try! req.parameters.next(Dish.self).delete(on: req)
    }
    
    
    func getDishById(req: Request) throws -> Future<Dish> {
        return try! req.parameters.next(Dish.self)
    }
    
    func getDishByTitle(req: Request) throws -> Future<[Dish]> {
        let title = try req.parameters.next(String.self).lowercased()
        return Dish.query(on: req).filter(\.title == title).all()
    }
    
    func createDish(req: Request, dish: Dish) throws -> Future<Dish> {
        return dish.save(on: req)
    }
    
    
}

