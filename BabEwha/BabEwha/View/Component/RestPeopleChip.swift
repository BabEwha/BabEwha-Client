//
//  RestPeopleChip.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct RestPeopleChip: View {
    let restPeople: Int
    var body: some View {
        HStack(spacing: 0) {
            Text("현재 ")
                .pretendard(size: .xs,
                            weight: .regular)
            Text("\(restPeople)명")
                .pretendard(size: .xs,
                            weight: .bold)
            Text(" 모였어요")
                .pretendard(size: .xs,
                            weight: .regular)
        }
        .foregroundStyle(Color.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.mainColor)
        .clipShape(RoundedRectangle(cornerRadius: 100))
        
    }
}

#Preview {
    RestPeopleChip(restPeople: 3)
}
