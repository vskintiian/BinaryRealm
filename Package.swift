// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.28.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/vskintiian/BinaryRealm/releases/download/\(realmVersion)"
    let realmChecksum = "3eb4e63d6adc80c52d81a4ebfaac708059937f3919f4a8d6291ed70fe623a4f9"
    let realmSwiftChecksum = "235a74900005acea87d44897b0d168384b2d18870057869f00771d98a30a97bd"
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift.xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "BinaryRealm",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)
