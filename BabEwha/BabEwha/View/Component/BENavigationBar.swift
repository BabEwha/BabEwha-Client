//
//  BENavigationBar.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct BENavigationBar: View {
    @Environment(\.dismiss) var dismiss
    
    let backButton: Bool
    let title: String
    
    var body: some View {
        HStack {
            if backButton {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                        .renderingMode(.template)
                        .colorMultiply(.black)
                }
            }
            
            Spacer()
            
            Text(title)
                .pretendard(size: .ms,
                            weight: .bold)
                .padding(.trailing, backButton ? 24 : 0)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64)
    }
}

#Preview {
    BENavigationBar(backButton: false,
                    title: "title")
}
