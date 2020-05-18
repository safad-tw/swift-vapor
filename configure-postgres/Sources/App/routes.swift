import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    
    
    
    router.post(Dish.self, at: "/dishes") { (req, dish) -> Future<Dish> in
        return dish.save(on: req)
    }
    
    router.get("/dishes") { (request) -> Future<[Dish]> in
        return Dish.query(on: request).all()
    }
    
    router.get("/dishes", Dish.parameter) { (request) -> Future<Dish> in
        return try request.parameters.next(Dish.self)
    }
    
    router.delete("/dishes", Dish.parameter) { (request) -> Future<Dish> in
        return try request.parameters.next(Dish.self).delete(on: request)
    }
    
    router.put(Dish.self, at: "/dishes") { (req, dish) -> Future<Dish> in
        return dish.update(on: req)
    }
    
    router.post(Dish.self, at: "/dishes") { (req, dish) -> Future<Dish> in
        return dish.save(on: req)
    }
    
    
}
