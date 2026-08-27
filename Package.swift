// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-complex-dimension",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Complex Dimension",
            targets: ["Complex Dimension"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-complex.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-dimension.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-numeric.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Complex Dimension",
            dependencies: [
                .product(name: "Complex", package: "swift-complex"),
                .product(name: "Dimension", package: "swift-dimension"),
                .product(name: "Real", package: "swift-numeric"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Complex Dimension Tests",
            dependencies: [
                "Complex Dimension",
                .product(name: "Complex", package: "swift-complex"),
                .product(
                    name: "Tagged Standard Library Integration",
                    package: "swift-tagged"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
