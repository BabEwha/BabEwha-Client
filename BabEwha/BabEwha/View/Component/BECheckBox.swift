//
//  BECheckBox.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct BECheckBox: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Button {
            isOn.toggle()
        } label: {
            labelView
        }
    }
    
    var labelView: some View {
        Image("checkmark")
            .foregroundStyle(Color.white)
            .frame(width: 20, height: 20)
            .background(isOn ? Color.mainColor : Color.beGray100)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    VStack {
        BECheckBox(isOn: .constant(true))
        BECheckBox(isOn: .constant(false))
    }
    .background(Color.black)
}
