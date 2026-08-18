// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeetingDoctorsSDK",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MeetingDoctorsSDKWrapper",
            targets: ["MeetingDoctorsSDKWrapper"]
        ),
        .library(
            name: "MeetingDoctorsSDKWrapper-Dynamic",
            targets: ["MeetingDoctorsSDKDynamicWrapper"]
        ),
        .library(
            name: "MeetingDoctorsSDKWrapper-NoAnalytics",
            targets: ["MeetingDoctorsSDKNoAnalyticsWrapper"]
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.1/MeetingDoctorsSDK.xcframework.zip",
            checksum: "d9b615d40f86407e9f65cde4829390b9ec93ea03f42310fd3225845d98058ddb"
        ),
        .target(
            name: "MeetingDoctorsSDKWrapper",
            dependencies: [
                "MeetingDoctorsSDK",
            ],
            path: "Sources/MeetingDoctorsSDKWrapper",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK_Dynamic",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.1/MeetingDoctorsSDK_Dynamic.xcframework.zip",
            checksum: "8dc39a1c7ec033699b300355e5eedbb4c58d846d4e8e929a94905cd28f76b049"
        ),
        .target(
            name: "MeetingDoctorsSDKDynamicWrapper",
            dependencies: [
                "MeetingDoctorsSDK_Dynamic"
            ],
            path: "Sources/MeetingDoctorsSDKDynamicWrapper",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .binaryTarget(
            name: "MeetingDoctorsSDK_NoAnalytics",
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.1/MeetingDoctorsSDK_NoAnalytics.xcframework.zip",
            checksum: "2590fdef376b9adeb51f7ecb6d5232a0a3e1c11068de9da106a5ce69b93f9cca"
        ),
        .target(
            name: "MeetingDoctorsSDKNoAnalyticsWrapper",
            dependencies: [
                "MeetingDoctorsSDK_NoAnalytics",
            ],
            path: "Sources/MeetingDoctorsSDKNoAnalyticsWrapper",
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
    ],
    swiftLanguageModes: [.v5]
)