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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.0/MeetingDoctorsSDK.xcframework.zip",
            checksum: "5ac8083c34ec7eaf4882d7ee2cdecfc2fc0e3990d3b7fcc9ccdbbe28c0fd4c87"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.0/MeetingDoctorsSDK_Dynamic.xcframework.zip",
            checksum: "b0d497057465c453a3a72ccb3270101412a4002e2bc3bf6e1275691c8ebaa066"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.0/MeetingDoctorsSDK_NoAnalytics.xcframework.zip",
            checksum: "ab4fac93fc320185301c96d65eaa143114b93c271a451d09a960a48fd688fe7b"
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