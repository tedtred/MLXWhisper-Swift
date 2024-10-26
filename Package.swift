// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "MLXWhisper",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "MLXWhisper",
            targets: ["MLXWhisper"])
    ],
    dependencies: [
        // Add dependencies here, e.g., .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "MLXWhisper",
            dependencies: []),
        .testTarget(
            name: "MLXWhisperTests",
            dependencies: ["MLXWhisper"])
    ]
)
