import ProjectDescription

let project = Project(
    name: "MyProject",
    packages: [
        .local(path: "MyPackage"),
    ],
    targets: [
        .target(
            name: "MyProject",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.MyProject",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MyProject/Sources/**"],
            resources: ["MyProject/Resources/**"],
            dependencies: [
                .package(product: "MyPackage"),
            ]
        ),
        .target(
            name: "MyProjectTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MyProjectTests",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["MyProject/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MyProject")]
        ),
    ]
)
