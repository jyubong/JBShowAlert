// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "JBSimpleAlert",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "JBSimpleAlert",
                 targets: ["JBSimpleAlert"])
    ],
    targets: [
        .target(name: "JBSimpleAlert",
                path: "JBSimpleAlert/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
