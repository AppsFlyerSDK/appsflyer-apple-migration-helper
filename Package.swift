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
            targets: ["AppsFlyerMigrationHelper"])
    ],
    targets: [
        .binaryTarget(
            name: "AppsFlyerMigrationHelper",
            url: "https://github.com/AppsFlyerSDK/appsflyer-apple-migration-helper/releases/download/1.0.3/AppsFlyerMigrationHelper.xcframework.zip",
            checksum: "cef1969ff40d35f8d8d60ccc9c6761601702b1b0931ba54b05c4ef9c9fcb560e"
        )
    ]
)
