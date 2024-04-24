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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsCore.xcframework.zip",
            checksum: "6709cd429817cc184d1cf5132380f427e5e1a179e15e797a723365f724877059"
        ),
        // MARK: - MeetingDoctorsSchema
        .binaryTarget(
            name: "MeetingDoctorsSchema",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsSchema.xcframework.zip",
            checksum: "d89e29e9eea473ed40c2f7ef2e834ca1fbabb62966a86c90550b116043a337e4"
        ),
        // MARK: - MeetingDoctorsController
        .binaryTarget(
            name: "MeetingDoctorsController",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsController.xcframework.zip",
            checksum: "003c7b1315546b821e8d485c95e01e95f2b7342bf8ddc59eaed1e255c180320c"
        ),
        // MARK: - MeetingDoctorsSocket
        .binaryTarget(
            name: "MeetingDoctorsSocket",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsSocket.xcframework.zip",
            checksum: "992db7deed2ec90ed38002c4dbf4d00e857de07f828c00583ab48e47397c90fc"
        ),
        // MARK: - MeetingDoctorsStorage
        .binaryTarget(
            name: "MeetingDoctorsStorage",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsStorage.xcframework.zip",
            checksum: "95a24a85206018438ecd7ab541e35b26bb75dea3ae5ec5f9a2bd4c9a94230ef2"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsRemote.xcframework.zip",
            checksum: "6666ebc95b1c06ce76cb48261161127e6a75f69c6a5e65fef4fc9071f011ea9c"
        ),
        // MARK: - MeetingDoctorsSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.0.1/MeetingDoctorsSDK.xcframework.zip",
            checksum: "608ad238047419e2fc59ff8ddbbb87ec24f8fd652d52973532b1dcf0dad0c359"
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
