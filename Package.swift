// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "topp",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "TopPCLI", targets: ["TopPCLI"]),
        .library(name: "TopP", targets: ["TopP"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0")
    ],
    targets: [
        .executableTarget(
            name: "TopPCLI",
            dependencies: [
                "TopPBenchmark",
                .product(name: "Benchmark", package: "swift-benchmark")
            ]
        ),
        .target(
            name: "TopPBenchmark",
            dependencies: [
                "TopP",
                .product(name: "Benchmark", package: "swift-benchmark")
            ]
        ),
        .target(
            name: "TopP"
        ),
        .testTarget(
            name: "TopPTests",
            dependencies:  ["TopP"]
        )
    ]
)
