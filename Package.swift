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
//        .package(url: "https://github.com/realm/realm-swift.git", from: "10.49.2"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.3.0"),
        .package(url: "https://github.com/opentok/vonage-client-sdk-video", from: "2.27.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MeetingDoctorsCore
        .binaryTarget(name: "MeetingDoctorsCore",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsCore.xcframework.zip",
            checksum: "a998b71fc72cf5d44485a35dc6951d3c8d4f275e7876542850e4eb417241986a"
        ),
        // MARK: - MeetingDoctorsSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsSchema.xcframework.zip",
            checksum: "aeaa2c9cc2eef389187774a68fa41a922338687bf05f28ba218eab41579502a0"
        ),
        // MARK: - MeetingDoctorsController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsController.xcframework.zip",
            checksum: "6a4c374816139d6f909e61315c51ae2434e35642e6000c24c16f072ed3da55fc"
        ),
        // MARK: - MeetingDoctorsSocket
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsSocket.xcframework.zip",
            checksum: "58b24da0471400752d5cbb17c0b0ba8634bc1bf0490efee3939a7d7d708810d5"
        ),
        // MARK: - MeetingDoctorsStorage
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsStorage.xcframework.zip",
            checksum: "6e82de117e0d8e9bb25b1b5689bf9eac8eb3fa77eca8d2f4fdc03ea2374f649a"
        ),
        // MARK: - Realm
        .binaryTarget(
            name: "RealmWrapper",
            path: "Frameworks/Realm.xcframework"
        ),
        // MARK: - RealmSwift
        .binaryTarget(
            name: "RealmSwiftWrapper",
            path: "Frameworks/RealmSwift.xcframework"
        ),
        // MARK: - MeetingDoctorsRemote
        .binaryTarget(
            name: "MeetingDoctorsRemote",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsRemote.xcframework.zip",
            checksum: "73b5fd325e894268fa4752161ab0ecff9eb2330808093d50aacacf887c9cd2be"
        ),
        // MARK: - MeetingDoctorsSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.2/MeetingDoctorsSDK.xcframework.zip",
            checksum: "d5f50b0594f2d789362bbac7206e641a0df5e92a7e0cc8283f31868a3d4f4bfd"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsCore",
                "MeetingDoctorsSchema",
                "MeetingDoctorsController",
                "MeetingDoctorsSocket",
                "RealmWrapper",
                "RealmSwiftWrapper",
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
