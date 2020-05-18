import Vapor


struct WelcomeContext: Encodable{
    var message: String
}
struct DisplayDishesContext: Encodable{
    var dishes: [Dish]
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    
    router.get("hello") { req in
        return try req.view().render("hello")
    }
    
    router.get("welcome") { req -> Future<View> in
        let context = WelcomeContext(message: "Weclome to leaf templates")
        return try req.view().render("hello", context)
    }
    
    router.get("display-dishes") { req -> Future<View> in
        let context = DisplayDishesContext(dishes: [Dish(name:"meat balls"), Dish(name:"Cheese cakes")])
        return try req.view().render("display-dishes", context)
    }
    
}
