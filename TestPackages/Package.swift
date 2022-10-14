// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestPackages",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TestPackages",
            targets: ["TestPackages"]),
        .library(
            name: "Core",
            targets: ["Core"]),
        .library(
            name: "Domain",
            targets: ["Domain"]),
        .library(
            name: "Helpers",
            targets: ["Helpers"]),
        .library(
            name: "Movies",
            targets: ["Movies"]),
        .library(
            name: "Persistance",
            targets: ["Persistance"]),
        .library(
            name: "Table",
            targets: ["Table"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.4.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TestPackages",
            dependencies: []),
        .target(
            name: "Core",
            dependencies: ["Persistance"]),
        .target(
            name: "Domain",
            dependencies: []),
        .target(
            name: "Helpers",
            dependencies: []),
        .target(
            name: "Movies",
            dependencies: ["Core", .product(name: "Resolver", package: "Resolver"), .product(name: "Kingfisher", package: "Kingfisher")]),
        .target(
            name: "Persistance",
            dependencies: ["Domain", "Helpers", .product(name: "Resolver", package: "Resolver")]),
        .target(
            name: "Table",
            dependencies: ["Core", .product(name: "Resolver", package: "Resolver")]),
        .testTarget(
            name: "TestPackagesTests",
            dependencies: ["TestPackages"]),
    ]
)
