// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "NativeKit",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "NativeKit",
            targets: ["NativeKit"]
        ),
    ],
    targets: [
        .target(
            name: "NativeKit"
        )
    ]
)
