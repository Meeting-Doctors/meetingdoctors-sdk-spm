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
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // MARK: - MeetingDoctorsSDK
        .binaryTarget(
            name: "MeetingDoctorsSDK",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/8.1.3-beta.13/MeetingDoctorsSDK.xcframework.zip",
            checksum: "97f94b8d96c08edd984c9278de11515b8eae8daa85b42856ad1411976a4705ef"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsSDK",
            ],
            path: "Sources/MeetingDoctorsSDKWrapper",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
    ]
)
