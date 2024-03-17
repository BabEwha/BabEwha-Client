//
//  LogoView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image("logo")
                .padding(.bottom, 300)
            
            BEButton(style: .login) {
                
            } label: {
                Text("이화인 계정으로 로그인")
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 16)
            
            BEButton(style: .signUp) {
                
            } label: {
                Text("1분 만에 가입하기")
                    .frame(maxWidth: .infinity)
            }

        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .padding(.horizontal, 24)
        .background(Color.mainColor)
    }
}

#Preview {
    LogoView()
}
