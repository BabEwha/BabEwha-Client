//
//  SelectImageSheet.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct SelectImageSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isActive: Bool
    @Binding var photo: Image?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Button {
                // dismiss bottom sheet
                photo = nil
                dismiss()
            } label: {
                HStack {
                    Spacer()
                    Image("xmark")
                }
            }
            .padding(.bottom, 24)
            
            HStack {
                Text("주문 사진 선택")
                    .pretendard(size: .m,
                                weight: .semibold)
                Spacer()
                
            }
            .padding(.bottom, 24)
            
            Button {
                // go to camera app
            } label: {
                HStack {
                    Text("카메라")
                        .pretendard(size: .s,
                                    weight: .regular)
                    Spacer()
                }
            }
            .padding(.vertical, 8)
            
            PhotoPickerView(image: $photo) {
                HStack {
                    Text("갤러리")
                        .pretendard(size: .s,
                                    weight: .regular)
                        .foregroundStyle(Color.black)
                    Spacer()
                }
            }
                .padding(.vertical, 8)
                .padding(.bottom, 24)
        }
        .padding(.top, 32)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.black)
        .background(Color.white)
        .clipShape(
            .rect(
                topLeadingRadius: 8,
                topTrailingRadius: 8
            )
        )
        .ignoresSafeArea(edges: .bottom)
        .onChange(of: photo) { oldValue, newValue in
            dismiss()
        }
        
    }
}

#Preview {
    ZStack {
        HomeView()
//        SelectImageSheet(isActive: .constant(false), photo: .constant(.placeHolder))
    }
}
