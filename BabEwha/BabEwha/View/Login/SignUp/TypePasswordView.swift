//
//  TypePasswordView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct TypePasswordView: View {
    @State var password: String = ""
    @State var comfirmPassword: String = ""
    @State var isPresentedAuthorityView: Bool = false
    @Binding var isSignUp: Bool
    var body: some View {
        VStack(alignment: .leading) {
            BENavigationBar(backButton: true,
                            title: "")
                .padding(.bottom, 20)
            
            Text("비밀번호를 입력해주세요")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 40)
            
            BETextField(title: "비밀번호",
                        placeHolder: "8자 이상 (영문, 숫자, 특수문자 포함)",
                        style: .secure,
                        text: $password)
                .padding(.bottom, 40)
            
            BETextField(title: "비밀번호",
                        placeHolder: "비밀번호를 한 번 더 입력하세요",
                        style: .secure,
                        text: $comfirmPassword)
            
            Spacer()
            
            BEButton(style: .plain) {
                // go to next page
                isPresentedAuthorityView = true
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }

        }
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $isPresentedAuthorityView) {
            AuthorityView(isSignUp: $isSignUp)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TypePasswordView(isSignUp: .constant(true))
}
