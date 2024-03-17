//
//  HandoutPlace.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct HandoutPlace: View {
    let handoutPlace: String
    var body: some View {
        VStack(alignment: .leading,
               spacing: 6) {
            HStack(spacing: 2) {
                Image("map.pin")
                    .resizable()
                    .frame(width: 12,
                           height: 12)
                Text("배부 장소")
                    .pretendard(size: .xs,
                                weight: .regular)
            }
            Text("\(handoutPlace)")
                .pretendard(size: .xs,
                            weight: .semibold)
        }
    }
}

#Preview {
    HandoutPlace(handoutPlace: "공학관")
}
