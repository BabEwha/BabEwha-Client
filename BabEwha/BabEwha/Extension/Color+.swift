//
//  Color+.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

extension Color {
    // Color chips
    static let mainColor: Color = .init(hex: 0xFF5B00)
    static let subColor300: Color = .init(hex: 0xFF4D00)
    static let subColor200: Color = .init(hex: 0xFF6B00)
    static let subColor100: Color = .init(hex: 0xFFAB6E)
    static let pointColor: Color = .init(hex: 0x009B50)
    static let disabledColor: Color = .init(hex: 0xFF5B00)
    
    // gray color scale 
    static let beGray300: Color = .init(hex: 0x3E3E3E)
    static let beGray200: Color = .init(hex: 0x8B8B8B)
    static let beGray100: Color = .init(hex: 0xF4F4F4)
    
    static let lightGray: Color = .init(hex: 0xE4E4E4)
    
    static let backgroundGray: Color = .init(hex: 0x8B8B8B,
                                        alpha: 0.5)
    
    // hex 값으로 색을 초기화합니다.
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
