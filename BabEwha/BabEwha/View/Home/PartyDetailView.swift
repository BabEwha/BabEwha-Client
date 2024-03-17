//
//  PartyDetailView.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//
import SafariServices
import SwiftUI

struct PartyDetailView: View {
    @Environment(\.openURL) var openURL
    @StateObject var toast: ToastViewModel = .init()
    
    let party: Party
    @State var photo: Image?
    @State var isActiveSheet: Bool = false
    @State var isPresentedDeliveryApp: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                BENavigationBar(backButton: true,
                                title: "주문하기")
                .padding(.horizontal, 24)
                
                // content section
                ScrollView {
                    VStack(alignment: .leading) {
                        Image.placeHolder
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: 200)
                            .padding(.bottom, 24)
                        
                        // 가게 이름 & 모인 인원 section
                        HStack {
                            Text("\(party.name)")
                                .pretendard(size: .l,
                                            weight: .semibold)
                            
                            RestPeopleChip(restPeople: party.maxNum)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)
                        
                        // 배부장소 & 현재인원 section
                        HStack(spacing: 40) {
                            VStack(alignment: .leading) {
                                HStack(spacing: 2) {
                                    Image("map.pin")
                                        .resizable()
                                        .frame(width: 12,
                                               height: 12)
                                    Text("배부 장소")
                                        .pretendard(size: .xs,
                                                    weight: .regular)
                                }
                                
                                Text("\(party.handoutPlace)")
                                    .pretendard(size: .xs,
                                                weight: .semibold)
                            }
                            
                            Divider()
                                .frame(maxHeight: 32)
                            
                            VStack(alignment: .leading) {
                                HStack(spacing: 2) {
                                    Image("user")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 12, height: 12)
                                    Text("현재 인원")
                                        .pretendard(size: .xs,
                                                    weight: .regular)
                                }
                                Text("\(party.maxNum)명")
                                    .pretendard(size: .xs,
                                                weight: .semibold)
                                +
                                Text(" 모였어요")
                                    .pretendard(size: .xs,
                                                weight: .regular)
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)
                        
                        // 주문 시간 section
                        HStack(spacing: 2) {
                            Image("clock")
                                .frame(width:12,
                                       height: 12)
                            Text("주문 시간")
                                .pretendard(size: .xs,
                                            weight: .medium)
                        }
                        .foregroundStyle(Color.mainColor)
                        .padding(.horizontal, 24)
                        
                        Text("18:15")
                            .pretendard(size: .xs,
                                        weight: .medium)
                            .foregroundStyle(Color.mainColor)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 32)
                        
                        
                        LargeDivider()
                            .padding(.bottom, 24)
                        
                        Group {
                            Text("리더벗의 한 마디🌟")
                                .pretendard(size: .l,
                                            weight: .semibold)
                                .padding(.bottom, 32)
                            
                            Text("\(party.body)")
                                .pretendard(size: .s,
                                            weight: .regular)
                                .padding(.bottom, 32)
                        }
                        .padding(.horizontal, 24)
                        
                        Group {
                            BEButton(style: .line) {
                                // open delivery app link(url)
                                
                                openDeliveryApp(openURLAction: openURL)
                            } label: {
                                VStack {
                                    Text("메뉴 보러가기")
                                        .pretendard(size: .m,
                                                    weight: .semibold)
                                    
                                    Text("클릭하면 배달 어플로 넘어가요")
                                        .pretendard(size: .s,
                                                    weight: .regular)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.bottom, 16)
                            
                            BEButton(style: .plain) {
                                // active bottom sheet
                                isActiveSheet = true
                            } label: {
                                VStack {
                                    Text("주문 보내기")
                                        .pretendard(size: .m,
                                                    weight: .semibold)
                                    Text("리더 벗에게 내 메뉴를 보내요!")
                                        .pretendard(size: .s,
                                                    weight: .regular)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.bottom, 64)
                        }
                        .padding(.horizontal, 24)
                        
                        
                        Spacer()
                    }
                }
            }
            
        }
        .overlay {
            if toast.isProcessing {
                BEProgressView()
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isActiveSheet) {
            SelectImageSheet(isActive: $isActiveSheet,
                             photo: $photo)
            .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: .constant(photo != nil)) {
            SendMenuSheet(party: party,
                          photo: $photo,
                          isActive: $isActiveSheet,
                          isProcess: $toast.isProcessing)
            .presentationDetents([.fraction(0.5)])
        }
        
    }
    func openDeliveryApp(openURLAction: OpenURLAction) {
//        let appURL = URL(string: "baemin://")
        
        // FIXME: 서버에서 오는 url로 변경
        let siteURL = URL(string: "https://baemin.me/HyoLzkt7V")
        
        guard let siteURL else { return }
        
        openURLAction.callAsFunction(siteURL) { accepted in
            
        }
    }
}

#Preview {
    PartyDetailView(party: .defaultModel)
}
