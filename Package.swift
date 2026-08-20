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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.2/MeetingDoctorsSDK.xcframework.zip",
            checksum: "b0327c89fcf19900e78be83b7310df4d447c206b8233f3a6ffb6edfb17f4e96b"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.2/MeetingDoctorsSDK_Dynamic.xcframework.zip",
            checksum: "68025d7c5049fcd5b94ff8c8c86d8858ddb2e60714c20e9bac7d89647b156c9a"
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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/11.4.0-beta.2/MeetingDoctorsSDK_NoAnalytics.xcframework.zip",
            checksum: "a9c2bb5aedc969c302d4b9116553b6b336b9d5dc4db6895919e1f0b5a08125ab"
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