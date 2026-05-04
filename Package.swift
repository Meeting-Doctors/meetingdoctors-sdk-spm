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
            url: "https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/10.1.1-beta.1/MeetingDoctorsSDK.xcframework.zip",
            checksum: "cba37d034b9956887e7e1a43012e3c3bc0aac9ba7cff4d8397e958cf2e71c03c"
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
