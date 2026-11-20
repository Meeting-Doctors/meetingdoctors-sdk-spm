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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.5/MeetingDoctorsSDK.xcframework.zip",
            checksum: "7d5e5e74a995422d71651c166aa2a2734be7280aad146d98d35a3e408b9033b7"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.5/MeetingDoctorsSDK_Dynamic.xcframework.zip",
            checksum: "df5a2b2a61531744c9f96d723fc1f0f4de7d1122f4a4959acd6be51a91671a09"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.5/MeetingDoctorsSDK_NoAnalytics.xcframework.zip",
            checksum: "2107dd96ad9ad050efb573b3e092a31ccad54968923bd8420b09034a89acbb0d"
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