//
//  Tag.swift
//  nyongnyong_iOSManifests
//
//  Created by 김용우 on 2022/12/20.
//

import Foundation

public protocol Tag {
    var id: UUID { get }
    var name: String { get }
    var articleIds: [UUID] { get }
    var created: TimeInterval { get }
    var size: CGFloat { get set }
}