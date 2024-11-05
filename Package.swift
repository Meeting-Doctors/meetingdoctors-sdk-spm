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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/6.2.3/MeetingDoctorsSDK.xcframework.zip",
            checksum: "7faa82f2ed7dfdd7e583089d64794cc6b57bb648491890aebc11eda959419cc4"
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
