//
//  SignInView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isPresentedFindPW: Bool = false
    
    @Binding var isLogin: Bool
    var body: some View {
        VStack {
            BENavigationBar(backButton: true,
                            title: "로그인")
                            .padding(.bottom, 28)
            
            BETextField(title: "이화인 메일",
                        placeHolder: "wowwowow@ewhain.net",
                        style: .email,
                        text: $email)
                        .padding(.bottom, 40)
            
            
            BETextField(title: "비밀번호",
                        placeHolder: "비밀번호를 입력해주세요",
                        style: .secure,
                        text: $password)
                        .padding(.bottom, 40)
            
            HStack {
                Spacer()
                Button {
                    // navigate to fine pw
                    isPresentedFindPW = true
                    
                } label: {
                    Text("비밀번호를 잊으셨나요?")
                        .underline()
                        .pretendard(size: .xs,
                                    weight: .regular)
                        .foregroundStyle(Color.beGray200)
                }
            }
            Spacer()
            
            BEButton(style: .plain) {
                // go to next page
                isLogin = true
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }

        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 24)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    SignInView(isLogin: .constant(true))
}
