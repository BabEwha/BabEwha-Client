//
//  AuthorityView.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct AuthorityView: View {
    @Binding var isSignUp: Bool
    var body: some View {
        VStack(alignment: .leading) {
            BENavigationBar(backButton: true,
                            title: "")
            
            Text("밥이화 앱에서 필요한\n권한을 알려드립니다")
                .pretendard(size: .xl,
                            weight: .semibold)
                .padding(.bottom, 16)
            
            Text("선택 권한은 선택하지 않아도 앱을 사용할 수 있으나,\n일부 기능이 제한될 수 있습니다")
                .pretendard(size: .xs,
                            weight: .regular)
                .foregroundStyle(Color.beGray200)
                .padding(.bottom, 44)
            
            
            HStack(spacing: 16) {
                Image("camera")
                
                VStack(alignment: .leading) {
                    Text("카메라")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    +
                    Text("(필수)")
                        .pretendard(size: .m,
                                    weight: .regular)
                    Text("OCR 사용을 위한 사진 촬영")
                        .pretendard(size: .s,
                                    weight: .regular)
                        .foregroundStyle(Color.beGray200)
                }
            }
            .padding(.bottom, 28)
            
            HStack(spacing: 16) {
                Image("bell.color")
                
                VStack(alignment: .leading){
                    Text("알림")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    +
                    Text("(선택)")
                        .pretendard(size: .m,
                                    weight: .regular)
                    Text("알림 메시지 발송")
                        .pretendard(size: .s,
                                    weight: .regular)
                        .foregroundStyle(Color.beGray200)
                }
                .foregroundStyle(Color.beGray300)
            }
            
            Spacer()
            
            BEButton(style: .plain) {
                // go to home page
                isSignUp = false
            } label: {
                Text("확인")
                    .frame(maxWidth: .infinity)
            }

            
        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AuthorityView(isSignUp: .constant(true))
}
