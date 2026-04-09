// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "AtprotoOAuth",
	platforms: [.iOS(.v17), .macOS(.v15)],
	products: [
		// Products define the executables and libraries a package produces, making them visible to other packages.
		.library(
			name: "AtprotoOAuth",
			targets: ["AtprotoOAuth"]
		)
	],
	dependencies: [
		.package(
			url: "https://github.com/nnabeyang/AtprotoClient.git",
			revision: "a388bd26fbb922689f794318d70c7f890dba8bab"
		),
		.package(
			url: "https://github.com/nnabeyang/AtprotoTypes",
			revision: "dd7c8cb6597d343b91c52a24b991e6cb647a7945"
		),
		.package(
			url: "https://github.com/germ-network/Microcosm.git",
			from: "0.1.0"
		),
		.package(
			url: "https://github.com/germ-network/oauth4swift.git",
			from: "0.2.0"
		),
		.package(
			url: "https://github.com/apple/swift-crypto.git",
			.upToNextMajor(from: "4.2.0")),
		.package(url: "https://github.com/apple/swift-http-types.git", from: "1.5.1"),
		.package(
			url: "https://github.com/nnabeyang/swift-atproto",
			revision: "8be6bcc5b31a57b3732b63642a59101cbe8912c8"
		),
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.target(
			name: "AtprotoOAuth",
			dependencies: [
				"AtprotoClient",
				"AtprotoTypes",
				.product(name: "Crypto", package: "swift-crypto"),
				.product(name: "HTTPTypes", package: "swift-http-types"),
				.product(name: "OAuth", package: "oauth4swift"),
				.product(name: "SwiftAtproto", package: "swift-atproto"),
			]
		),
		.testTarget(
			name: "AtprotoOAuthTests",
			dependencies: [
				"AtprotoOAuth",
				"Microcosm",
			]
		),
	]
)
