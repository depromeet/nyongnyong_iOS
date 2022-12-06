//
//  Color+CustomColor.swift
//  UserInterface
//
//  Created by Joseph Cha on 2022/11/26.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import SwiftUI

public extension Color {
    static var black: Color { return Color("black") }
    static var grey1: Color { return Color("grey1") }
    static var grey2: Color { return Color("grey2") }
    static var grey2Line: Color { return Color("grey2Line") }
    static var grey3: Color { return Color("grey3") }
    static var grey4: Color { return Color("grey4") }
    static var primary: Color { return Color("primary") }
    static var white: Color { return Color("white") }
}


// MARK: - BackgroundColor
struct SetupBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.grey1
                .ignoresSafeArea(.all)
            content
        }
    }
}

public extension View {
    func setupBackground() -> some View {
        modifier(SetupBackground())
    }
}
