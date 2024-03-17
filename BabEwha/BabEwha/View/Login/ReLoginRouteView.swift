//
//  ReLoginRouteView.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct ReLoginRouteView: View {
    @State var isLogin: Bool = false
    var body: some View {
        if isLogin {
            TabBarRouteView()
        } else {
            NavigationStack {
                LogoView(isLogin: $isLogin)
            }
        }
    }
}

#Preview {
    ReLoginRouteView()
}
