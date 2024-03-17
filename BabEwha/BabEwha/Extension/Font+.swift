//
//  Font+.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

extension Font {
    // font를 구분하는 열거형입니다.
    // 열거형의 Element들은 Weight를 Element로 갖습니다.
    enum BEFont {
        enum Pretendard: String {
            case regular = "PretendardVariable-Regular"
            case thin = "PretendardVariable-Thin"
            case extraLight = "PretendardVariable-ExtraLight"
            case light = "PretendardVariable-Light"
            case medium = "PretendardVariable-Medium"
            case semibold = "PretendardVariable-SemiBold"
            case bold = "PretendardVariable-Bold"
            case extraBold = "PretendardVariable-ExtraBold"
            case black = "PretendardVariable-Black"
        }
    }

    // font의 size를 구분하는 열거형입니다.
    enum BEFontSize: CGFloat {
        case xxs = 12
        case xs = 14
        case s = 16
        case ms = 18
        case m = 20
        case l = 24
        case xl = 28
        case xxl = 32
    }
    
    // pretendard 폰트 적용
    static func pretendard(size: BEFontSize,
                           weight: BEFont.Pretendard) -> Font {
        return .custom(weight.rawValue,
                size: size.rawValue)
    }
}

extension Text {
    func pretendard(size: Font.BEFontSize,
                           weight: Font.BEFont.Pretendard) -> Text {
        return self.font(.pretendard(size: size,
                                 weight: weight))
    }
}

extension View {
    func pretendard(size: Font.BEFontSize,
                           weight: Font.BEFont.Pretendard) -> some View {
        return self.font(.pretendard(size: size,
                                 weight: weight))
    }
}
