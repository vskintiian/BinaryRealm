// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let realmVersion = "10.24.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/vskintiian/BinaryRealm/releases/download/\(realmVersion)"
    let realmChecksum = "d207a7ab1f3257ac644a2d13bae6f990f32f874453313fb509dd75d91e7116df"
    let realmSwiftChecksum = "bb8243db3a14a1df47c0239fea09f5a38eff526cced3c0f71234b650be1c534c"
    
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
