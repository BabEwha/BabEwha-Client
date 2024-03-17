//
//  Information.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

enum Information: String {
    case place = "map.pin"
    case time = "clock"
    case user = "user"
}

struct InformationView: View {
    let style: Information
    let content: String
    
    private var title: String {
        switch style {
        case .place:
            return "배부 장소"
        case .time:
            return "주문 시간"
        case .user:
            return "현재 인원"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 6) {
            HStack(spacing: 2) {
                Image(style.rawValue)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 12,
                           height: 12)
                    .colorMultiply(.beGray200)
                
                Text(title)
                    .pretendard(size: .xs,
                                weight: .regular)
                    .foregroundStyle(Color.beGray200)
            }
            Text(content)
                .pretendard(size: .xs,
                            weight: .semibold)
            
        }
    }
}

#Preview {
    InformationView(style: .time,
                    content: "16.35")
}
