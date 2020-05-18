// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "configure-postgres",
    products: [
        .library(name: "configure-postgres", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

       // package for fluent postgreSQL
             .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc"),
             
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentPostgreSQL","FluentSQLite", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

