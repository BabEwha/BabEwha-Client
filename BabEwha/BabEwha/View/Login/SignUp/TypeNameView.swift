//
//  TypeNameView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct TypeNameView: View {
    @State var name: String = ""
    @State var isPresentedPasswordView: Bool = false
    @Binding var isSignUp: Bool
    var body: some View {
        VStack(alignment: .leading) {
            BENavigationBar(backButton: true,
                            title: "")
                .padding(.bottom, 20)
            
            Text("이름을 입력해주세요")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 40)
            BETextField(title: "이름",
                        placeHolder: "1자 이상 24자 이하 (영문, 한글)",
                        style: .plain,
                        text: $name)
            
            Spacer()
            
            BEButton(style: .plain) {
                // go to next page
                isPresentedPasswordView = true
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }

        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $isPresentedPasswordView) {
            TypePasswordView(isSignUp: $isSignUp)
        }
    }
}

#Preview {
    TypeNameView(isSignUp: .constant(true))
}
