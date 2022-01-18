// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.21.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/vskintiian/BinaryRealm/releases/download/\(realmVersion)"
    let realmChecksum = "7d04cbeec6ae3e739ab0a68ce97dd29511733612a40b15990acaae5dba6a6b63"
    let realmSwiftChecksum = "4bb54207b7f62ed5f041b06963c72d59c75ff57fed3100a87123766927659bf7"
    
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
