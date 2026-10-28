// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SampleKit",
    platforms: [.macOS(.v15)],
    products: [
        .library(name: "SampleKit", targets: ["SampleKit"])
    ],
    targets: [
        .target(name: "SampleKit")
    ]
)
