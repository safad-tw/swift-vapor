import Vapor

import FluentSQLite

final class Movie: Content {
    
    var movieName: String
    var year: Int
    var id:String?
    
    init(movieName: String, year: Int) {
        self.movieName = movieName
        self.year = year
    }
}
/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    
    let moviesGrouped = router.grouped("api/movies")
    
    let dishesController = DishesController()
    try router.register(collection: dishesController)
    
    
    moviesGrouped.get("action") {req in
        return "Action Movies here you go ...."
    }
    
    moviesGrouped.get("comedy") { req in
        return "Comedy Movies here you go ...."
    }
    
    router.get("movies", String.parameter, "year", Int.parameter) { req -> String in
        let genre  = try req.parameters.next(String.self)
        let year  = try req.parameters.next(Int.self)
        
        
        return "Genre \(genre) and year \(year)"
    }
    
    router.get("movies") { req -> String in
        let search  = try req.query.get(String.self, at: "search")
        let page  = try req.query.get(Int.self, at: "page")
        let sort  = try req.query.get(String.self, at: "sort")
        return "Search \(search) page \(page) sort \(sort)"
    }
    
    
    router.get { req in
        return "It works!"
    }
    
    router.get("movies") { req -> [Movie] in
        let movie = Movie(movieName: "DDH", year:1992)
        return [movie]
        
    }
    // Basic "Hello, world!" example
    router.get("hello") { req -> Future<String> in
        return Future.map(on: req) { () -> String in
            return "Hello, world!"
        }
    }
    
    router.get("greet", String.parameter) { req -> String in
        let name  = try req.parameters.next(String.self)
        return "Hello,\(name)"
    }
    
    router.post(Movie.self, at:"api/movie")  { req, data -> Future<Movie> in
        return Future.map(on: req) { () -> Movie in
            data.id = "2222"
            return data
        }
    }
    
    
//    router.get("api/dishes", Dish.parameter) { req -> Future<Dish> in
//        return try req.parameters.next(Dish.self)
//    }
//
//    router.delete("api/dishes", Dish.parameter) { req -> Future<Dish> in
//        return try req.parameters.next(Dish.self).delete(on: req)
//    }
//
//
//    router.post(Dish.self, at: "api/dish") { req, dish -> Future<Dish>
//        in
//        return dish.save(on: req)
//    }
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
