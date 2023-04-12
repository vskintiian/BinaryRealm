// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.38"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/vskintiian/BinaryRealm/releases/download/\(realmVersion)"
    let realmChecksum = "4070c85df606ce379f43922eefda193ee9135358efd91eae90c588417c0347b8"
    let realmSwiftChecksum = "efcfeae8a06e658fd3ae7d4c3b6017d1bba739b4d0691ff83989703389899fe2"
    
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
