// swift-tools-version:5.7
import PackageDescription

#if canImport(Compression)
    let targets: [Target] = [
        .target(name: "ZIPFoundation",
                dependencies: [
                    .product(name: "SystemPackage", package: "swift-system"),
                    .product(name: "CSProgress", package: "CSProgress"),
                ]),
        .testTarget(name: "ZIPFoundationTests",
                    dependencies: ["ZIPFoundation"],
                    resources: [
                        .process("Resources"),
                    ]),
    ]
#else
    let targets: [Target] = [
        .target(name: "ZIPFoundation",
                dependencies: [
                    .product(name: "ZLib", package: "zlib"),
                    .product(name: "SystemPackage", package: "swift-system"),
                    .product(name: "CSProgress", package: "CSProgress"),
                ]),
        .testTarget(name: "ZIPFoundationTests",
                    dependencies: ["ZIPFoundation"],
                    resources: [
                        .process("Resources"),
                    ]),
    ]
#endif

let package = Package(
    name: "ZIPFoundation",
    platforms: [
        .macOS(.v11), .iOS(.v12), .tvOS(.v12), .watchOS(.v4),
    ],
    products: [
        .library(name: "ZIPFoundation", targets: ["ZIPFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-system", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/gregcotten/CSProgress", .upToNextMajor(from: "0.0.1")),
        .package(url: "https://github.com/the-swift-collective/zlib", from: "1.3.1")
    ],
    targets: targets
)
