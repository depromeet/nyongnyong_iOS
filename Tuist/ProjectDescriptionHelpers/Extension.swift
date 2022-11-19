//
//  Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Yongwoo Marco on 2022/11/11.
//

import ProjectDescription

public extension TargetDependency {
//	static let swinject = TargetDependency.package(product: "Swinject")
}

public extension Package {
//	static let swinject = Package.remote(
//		url: "https://github.com/Swinject/Swinject.git",
//		requirement: .upToNextMajor(from: .init(2, 8, 1))
//	)
}

// MARK: - SourceFile
public extension SourceFilesList {
	static let sources: SourceFilesList = "Sources/**"
	static let tests: SourceFilesList = "Tests/**"
}

// MARK: - Resource
public enum ResourceType: String {
	case xibs = "Sources/**/*.xib"
	case storyboards = "Resources/**/*.storyboard"
	case assets = "Resources/**"
}

// MARK: - Extension
public extension Array where Element == FileElement {
	static func resources(with resources: [ResourceType]) -> [FileElement] {
		resources.map { FileElement(stringLiteral: $0.rawValue) }
	}
}
