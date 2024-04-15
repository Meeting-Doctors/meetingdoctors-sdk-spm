// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsSDKWrapper",
            targets: ["MeetingDoctorsSDKWrapper"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0"),
        .package(url: "https://github.com/Meeting-Doctors/socket.io-client-swift", exact: "17.0.0"),
//        .package(url: "https://github.com/realm/realm-swift.git", from: "10.47.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.3.0"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video", from: "2.27.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MeetingDoctorsCore
        .binaryTarget(name: "MeetingDoctorsCore",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsCore.xcframework.zip",
            checksum: "e97b91521f30039c4fe625b71dfd7f04144c651eee84e58304b5201f036e10a0"
        ),
        // MARK: - MeetingDoctorsSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsSchema.xcframework.zip",
            checksum: "1c26118cc3b65e6a2b908834d33900ea67c40c2116d5e92705ec73d128dfc7ef"
        ),
        // MARK: - MeetingDoctorsController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsController.xcframework.zip",
            checksum: "0e4b36dab87b7616e1732932e1da2f078a614bcd203cd10579026fa446de3bc1"
        ),
        // MARK: - MeetingDoctorsSocket
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsSocket.xcframework.zip",
            checksum: "e04a156f4c45ff6d3f780f070f766b97c857b970076d3a0041afb9e7164f56d6"
        ),
        // MARK: - MeetingDoctorsStorage
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsStorage.xcframework.zip",
            checksum: "8680592bac179e841d2127389f961f77391d3f0cf55a939bf13766ac2dc7b94f"
        ),
        // MARK: - Realm
        .binaryTarget(
            name: "Realm",
            path: "Frameworks/Realm.xcframework"
        ),
        // MARK: - RealmSwift
        .binaryTarget(
            name: "RealmSwift",
            path: "Frameworks/RealmSwift.xcframework"
        ),
        // MARK: - MeetingDoctorsRemote
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsRemote.xcframework.zip",
            checksum: "511085acafe9efbee879507d21e7a6ea95973255c82c8812e2e6051c71f26830"
        ),
        // MARK: - MeetingDoctorsSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.0/MeetingDoctorsSDK.xcframework.zip",
            checksum: "d5a1e5becf1657f80de96590d2df558dda7a125d5be77cc355753d61539f0379"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsCore",
                "MeetingDoctorsSchema",
                "MeetingDoctorsController",
                "MeetingDoctorsSocket",
                "Realm",
                "RealmSwift",
                "MeetingDoctorsStorage",
                "MeetingDoctorsRemote",
                "MeetingDoctorsSDK",
//                .product(name: "Realm", package: "realm-swift"),
//                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "SocketIO", package: "socket.io-client-swift"),
                .product(name: "VonageClientSDKVideo", package: "vonage-client-sdk-video"),
            ],
            path: "Sources/MeetingDoctorsSDKWrapper"
        ),
    ]
)
