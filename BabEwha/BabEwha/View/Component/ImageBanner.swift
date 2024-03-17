//
//  ImageBanner.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct ImageBanner: View {
    let restPeople: Int
    
    var body: some View {
        HStack {
            Text("남은 인원")
                .pretendard(size: .ms,
                            weight: .regular)
            Text("\(restPeople)명")
                .pretendard(size: .ms,
                            weight: .bold)
        }
            .foregroundStyle(Color.white)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background(Color.mainColor)
            .clipShape(
                .rect(
                    bottomLeadingRadius: 8,
                    bottomTrailingRadius: 8
                )
            )
            
    }
}

#Preview {
        Image.placeHolder
            .cornerRadius(8)
            .overlay(alignment: .bottomLeading) {
                    ImageBanner(restPeople: 3)
            }
}
