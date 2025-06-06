// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let local = false

let pykit_package: Package.Dependency = if local {
    
    .package(path: "../PySwiftKit")
    
} else {
    
        .package(url: "https://github.com/kv-swift/PySwiftKit", from: .init(311, 0, 0))
    
}

let pykit: Target.Dependency = .product(name: "SwiftonizeModules", package: "PySwiftKit")


let package = Package(
    name: "PyCoreMidi",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PyCoreMidi",
            targets: ["PyCoreMidi"]
        ),
    ],
    dependencies: [
        pykit_package,
        // add other packages for the py wrapper to utilize
        .package(url: "https://github.com/AudioKit/AudioKit", .upToNextMajor(from: "5.6.5"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PyCoreMidi",
            dependencies: [
                pykit,
                .product(name: "AudioKit", package: "AudioKit")
            ]
            
        ),
        
    ]
)
