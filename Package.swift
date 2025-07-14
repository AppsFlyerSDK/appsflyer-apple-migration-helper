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
            url: "https://github.com/AppsFlyerSDK/appsflyer-apple-migration-helper/releases/download/1.0.0/AppsFlyerMigrationHelper.xcframework.zip",
            checksum: "e54461fde148da5e551594e4d7f7309465be8f4679041c1390fdf09d8f8fc37b"
        )
    ]
)
