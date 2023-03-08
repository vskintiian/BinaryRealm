// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.30.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/vskintiian/BinaryRealm/releases/download/\(realmVersion)"
    let realmChecksum = "4f509a0a12b5b1eab0b99d07b68744379ad8b43a26354de3160611f483918b22"
    let realmSwiftChecksum = "cbcc5c1f6cada95e21c8bd0920beb3b5d244ff4365ab2c1bf8f1c6478eb9c2e9"
    
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
