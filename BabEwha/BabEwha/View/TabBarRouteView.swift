//
//  TabBarRouteView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct TabBarRouteView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
                .tabItem {
                    Text("홈")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Image("home")
                        .renderingMode(.template)
                }
            // tabbar back ground color change (반투명 -> 불투명)
                .toolbarBackground(Color.white,
                                   for: .tabBar)
            
            
            
            NavigationStack {
                LeaderHistoryView(party: .defaultModel)
                    .navigationBarBackButtonHidden()
            }
                .tabItem {
                    Text("주문 현황")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Image("history")
                        .renderingMode(.template)
                }
                .toolbarBackground(Color.white,
                                   for: .tabBar)
                
            NavigationStack {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
                .tabItem {
                    Text("모임 추가")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Image("add.circle")
                        .renderingMode(.template)
                }
                .toolbarBackground(Color.white,
                                   for: .tabBar)
            
            NavigationStack {
                ArchiveView()
                    .navigationBarBackButtonHidden()
            }
                .tabItem {
                    Text("주문 내역")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Image("archive")
                        .renderingMode(.template)
                }
                .toolbarBackground(Color.white,
                                   for: .tabBar)
            
            NavigationStack {
                ProfileView()
                    .navigationBarBackButtonHidden()
            }
                .tabItem {
                    Text("내 정보")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Image("user")
                        .renderingMode(.template)
                }
                .toolbarBackground(Color.white,
                                   for: .tabBar)
        }
        .accentColor(.mainColor)
    }
}

#Preview {
    TabBarRouteView()
}
