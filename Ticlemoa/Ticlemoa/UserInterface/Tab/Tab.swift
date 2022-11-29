//
//  Tab.swift
//  Ticlemoa
//
//  Created by 김우성 on 2022/11/28.
//

import SwiftUI

enum Tab {
    case home
    case community
    
    var textItem: Text {
        switch self {
        case .home: return Text("홈")
        case .community: return Text("모아모아")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image("home")
        case .community: return Image("community")
        }
    }
}
