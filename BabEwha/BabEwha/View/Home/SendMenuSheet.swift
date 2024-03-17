//
//  SendMenuSheet.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct SendMenuSheet: View {
    @Environment(\.dismiss) var dismiss
    
    let party: Party
    @Binding var photo: Image?
    
    @Binding var isActive: Bool
    @Binding var isProcess: Bool
    @State var isAgree: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(party.name)")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    
                    
                    
                    HandoutPlace(handoutPlace: party.handoutPlace)
                }
                Spacer()
                
                photo?
                    .resizable()
                    .frame(width: 160,
                           height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.bottom, 8)
            
            HStack {
                BECheckBox(isOn: $isAgree)
                VStack(alignment: .leading) {
                    Text("이 주문으로 보낼까요?")
                        .pretendard(size: .s,
                                    weight: .regular)
                    Text("보낸 후에는 취소하거나 수정할 수 없어요")
                        .pretendard(size: .s,
                                    weight: .regular)
                }
            }
            .padding(.bottom, 16)
            .onTapGesture {
                isAgree.toggle()
            }
            
            BEButton(style: isAgree ? .plain : .disable) {
                // send menu
                // progress
                photo = nil
                
            } label: {
                VStack {
                    Text("주문 보내기")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    Text("리더벗에게 내 메뉴를 보내요!")
                        .pretendard(size: .s,
                                    weight: .regular)
                }
                .frame(maxWidth: .infinity)
            }
            
            
        }
        .padding(.top, 24)
        .padding(.bottom, 24)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(
            .rect(
                topLeadingRadius: 8,
                topTrailingRadius: 8
            )
        )
        
    }
    
}

#Preview {
    SendMenuSheet(party: .defaultModel,
                  photo: .constant(.placeHolder),
                  isActive: .constant(true),
                  isProcess: .constant(true))
    .environmentObject(ToastViewModel())
}
