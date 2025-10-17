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
            url: "https://github.com/AppsFlyerSDK/appsflyer-apple-migration-helper/releases/download/1.0.4/AppsFlyerMigrationHelper.xcframework.zip",
            checksum: "183f4efe3d6157dbece0765ee424f11f1d36df9bb3421456aa439b14005f287b"
        )
    ]
)
