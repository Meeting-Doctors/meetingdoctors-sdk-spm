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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.3/MeetingDoctorsSDK.xcframework.zip",
            checksum: "cf4da3ef057f0c542125039a3eb5c3cd307ec16f1fcd7cac5f7fb46afaf001a6"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.3/MeetingDoctorsSDK_Dynamic.xcframework.zip",
            checksum: "a7cb215fe8db1eb49fd46330d48b8b786bba5670172d10499eda0f33eff8f7c6"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.6.3/MeetingDoctorsSDK_NoAnalytics.xcframework.zip",
            checksum: "63631fafc1fdb1ccd5357621c519063f849286d1cd72c326191c5eff687e6a03"
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