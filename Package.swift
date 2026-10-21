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
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-complex.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-angle.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-numeric.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Complex Dimension",
            dependencies: [
                .product(name: "Complex", package: "swift-complex"),
                .product(name: "Angle", package: "swift-angle"),
                .product(name: "Numeric", package: "swift-numeric"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Complex Dimension Tests",
            dependencies: [
                .target(name: "Complex Dimension"),
                .product(name: "Complex", package: "swift-complex"),
                .product(name: "Angle", package: "swift-angle"),
                .product(name: "Numeric", package: "swift-numeric"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
