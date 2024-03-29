//
//  LogoView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct LogoView: View {
    @State var isPresentedSignInView: Bool = false
    @Binding var isLogin: Bool
    @State var isSignUp: Bool = false
    
    var body: some View {
        VStack {
            Image("logo")
                .padding(.bottom, 300)
            
            BEButton(style: .login) {
                isPresentedSignInView = true
            } label: {
                Text("이화인 계정으로 로그인")
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 16)
            
            BEButton(style: .signUp) {
                isSignUp = true
            } label: {
                Text("1분 만에 가입하기")
                    .frame(maxWidth: .infinity)
            }

        }
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .padding(.horizontal, 24)
        .background(Color.mainColor)
        .navigationDestination(isPresented: $isPresentedSignInView) {
            SignInView(isLogin: $isLogin)
        }
        .navigationDestination(isPresented: $isSignUp) {
            TypeEmailView(isSignUp: $isSignUp)
        }
    }
}

#Preview {
    NavigationStack {
        LogoView(isLogin: .constant(true))
    }
}
