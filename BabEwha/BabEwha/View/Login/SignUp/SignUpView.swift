//
//  SignUpView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

// 회원가입 
struct SignUpView: View {
    @State var isSignUp: Bool = true
    
    var body: some View {
        if isSignUp {
          TypeEmailView(isSignUp: $isSignUp)
        } else {
            ReLoginRouteView()
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
    }
}
