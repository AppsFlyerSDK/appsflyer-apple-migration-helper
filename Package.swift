// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "AppsFlyerMigrationHelper",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AppsFlyerMigrationHelper",
            type: .dynamic,
            targets: ["AppsFlyerMigrationHelper"])
    ],
    targets: [
        .binaryTarget(
            name: "AppsFlyerMigrationHelper",
            path: "AppsFlyerMigrationHelper.xcframework"
        )
    ]
)
