//
//  LargeDivider.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct LargeDivider: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(Color.beGray100)
            .frame(maxWidth: .infinity)
            .frame(height: 12)
    }
}

#Preview {
    LargeDivider()
}
