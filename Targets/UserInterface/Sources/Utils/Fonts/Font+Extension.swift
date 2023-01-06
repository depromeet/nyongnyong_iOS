//
//  Font+Extension.swift
//  Ticlemoa
//
//  Created by 김우성 on 2022/12/04.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import SwiftUI
import UIKit.UIFont

extension UIFont {
    static func pretend(
        size: CGFloat = 12,
        weight: PretendardFontWeight = .regular
    ) -> UIFont {
        return UIFont(name: "Pretendard-\(weight.rawValue)", size: size) ?? UIFont.boldSystemFont(ofSize: 50)
    }
    
    static func setupCustomFont(
        weight: CGFloat,
        size: CGFloat = 12,
        style: PretendardFontWeight
    ) -> UIFont {
        return UIFont(name: "Pretendard-\(style.rawValue)", size: size) ?? UIFont.boldSystemFont(ofSize: 50)
    }
}


public enum PretendardFontWeight: String {
    case thin = "Thin"              // 100
    case extraLight = "ExtraLight"  // 200
    case light = "Light"            // 300
    case regular = "Regular"        // 400
    case medium = "Medium"          // 500
    case semiBold = "SemiBold"      // 600
    case bold = "Bold"              // 700
    case extraBold = "ExtraBold"    // 800
    case black = "Black"            // 900
}

public enum FontSystem {
    /// size: 18,  lineHeight: 27,  Weight: 700
    case title3
    
    /// size: 16,  lineHeight: 24,  Weight: 700
    case title2
    
    /// size: 14,  lineHeight: 21,  Weight: 700
    case title1
    
    /// size: 18,  lineHeight: 27,  Weight: 600
    case subhead4
    
    /// size: 16,  lineHeight: 24,  Weight: 600
    case subhead3
    
    /// size: 14,  lineHeight: 21,  Weight: 600
    case subhead2
    
    /// size: 12,  lineHeight: 18,  Weight: 600
    case subhead1
    
    /// size: 18,  lineHeight: 27,  Weight: 500
    case body4
    
    /// size: 16,  lineHeight: 24,  Weight: 500
    case body3
    
    /// size: 14,  lineHeight: 21,  Weight: 500
    case body2
    
    /// size: 12,  lineHeight: 18,  Weight: 500
    case body1
    
    var weight: PretendardFontWeight {
        switch self {
        case .title3, .title2, .title1:
            return .bold
        case .subhead4,. subhead3, .subhead2, .subhead1:
            return .semiBold
        case .body4, .body3, .body2, .body1:
            return .medium
        }
    }
    
    var size: CGFloat {
        switch self {
        case .title3, .subhead4, .body4:
            return 18
        case .title2, .subhead3, .body3:
            return 16
        case .title1, .subhead2, .body2:
            return 14
        case .subhead1, .body1:
            return 12
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .title3, .subhead4, .body4:
            return 27
        case .title2, .subhead3, .body3:
            return 24
        case .title1, .subhead2, .body2:
            return 21
        case .subhead1, .body1:
            return 18
        }
    }
}

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(
                abs(lineHeight - font.lineHeight)
            )
            .padding(
                .vertical,
                (abs(lineHeight - font.lineHeight) / 2)
            )
    }
}

extension View {
    func pretendFont(
            _ font: FontSystem
        ) -> some View {
            let size = font.size
            let weight = font.weight
            let lineHeight = font.lineHeight
            
            let font: UIFont = UIFont.pretend(
                size: size,
                weight: weight
            )
            
            return ModifiedContent(
                content: self,
                modifier: FontWithLineHeight(
                    font: font,
                    lineHeight: lineHeight)
            )
        }
    
    func customFont(
        weight: CGFloat,
        size: CGFloat,
        lineHeight: CGFloat,
        style: PretendardFontWeight = .medium
    ) -> some View {
        
        let font: UIFont = UIFont.setupCustomFont(
            weight: weight,
            size: size,
            style: style
        )
        
        return ModifiedContent(
            content: self,
            modifier: FontWithLineHeight(
                font: font,
                lineHeight: lineHeight)
        )
    }
}

struct FontTestView: View {
    var body: some View {
        VStack() {
            
            Text("반갑습니다!\n티끌모아에서 모아봐요")
                .customFont(
                    weight: 700,
                    size: 16,
                    lineHeight: 28, style: .bold
                ).setupBackground()
            
            Text("전체")
                .customFont(
                    weight: 700,
                    size: 14,
                    lineHeight: 21,
                    style: .bold
                )
                .foregroundColor(Color.white)
                .background(Color.black)
            
            Text("아티클 제목은 최대 2줄로 적어주세요.\n컨테이너를 넘을 경우...으로")
                .customFont(
                    weight: 600,
                    size: 16,
                    lineHeight: 24,
                    style: .semiBold
                )
                .setupBackground()
            
        }
    }
}

struct FontTestView_Previews: PreviewProvider {
    static var previews: some View {
        FontTestView()
    }
}
