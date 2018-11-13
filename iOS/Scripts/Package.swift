// swift-tools-version:4.0
import PackageDescription

let mainAppName = "Scripty"
let frameworkName = "ScriptyCore"

let package = Package(
    name: mainAppName,
    products: [
      .executable(
        name: mainAppName,
        targets: [mainAppName]
      ),
      .library(
        name: frameworkName,
        targets: [frameworkName]
      )
    ],
    dependencies: [
        .package(
          url: "https://github.com/JohnSundell/Files.git",
          from: "2.0.0"
        ),
        .package(
          url: "https://github.com/JohnSundell/ShellOut.git",
          from: "2.0.0"
        ),
    ],
    targets: [
        .target(
          name: mainAppName,
          dependencies: ["ScriptyCore"]
        ),
        .target(
          name: frameworkName,
          dependencies: ["Files", "ShellOut"]
        )
    ]
)
