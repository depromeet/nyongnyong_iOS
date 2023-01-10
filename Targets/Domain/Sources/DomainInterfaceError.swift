//
//  DomainInterfaceError.swift
//  DomainInterface
//
//  Created by Joseph Cha on 2023/01/09.
//  Copyright © 2023 nyongnyong. All rights reserved.
//

import Foundation

public enum DomainInterfaceError: Error {
    case networkError(code: Int)
}
