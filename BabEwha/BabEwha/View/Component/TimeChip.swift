//
//  TimeChip.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct TimeChip: View {
    let time: Date
    var body: some View {
        Text("3:53")
            .pretendard(size: .m, weight: .semibold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 18)
            .background(Color.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TimeChip(time: .now)
}
