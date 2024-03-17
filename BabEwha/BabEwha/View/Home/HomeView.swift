//
//  HomeView.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

struct HomeView: View {
    @State var selectedPlace: Place = .공학관
    @State var isActivePlaceSheet: Bool = false
    let parties: [Party] = [
        .init(id: 1, name: "영천 닭강정", createdDate: .now,
              timeLimit: .now, partyImage: "", maxNum: 2, body: "맛있어요 같이 먹어요", link: "", place: "공대 입구",
              handoutPlace: "신공학관 1층"),
        .init(id: 2, name: "영천 닭강정", createdDate: .now,
              timeLimit: .now, partyImage: "", maxNum: 2, body: "맛있어요 같이 먹어요", link: "", place: "공대 입구",
              handoutPlace: "신공학관 1층"),
        .init(id: 3, name: "영천 닭강정", createdDate: .now,
              timeLimit: .now, partyImage: "", maxNum: 2, body: "맛있어요 같이 먹어요", link: "", place: "공대 입구",
              handoutPlace: "신공학관 1층")
    ]
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        // 10분 이내 마감
                        Text("10분 이내 마감되는 배달")
                            .pretendard(size: .l,
                                        weight: .semibold)
                            .padding(.horizontal, 24)
                            .padding(.top, 28)
                            .padding(.bottom, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(parties, id: \.id) { party in
                                    NavigationLink{
                                        PartyDetailView(party: party)
                                            
                                    } label:{
                                        PartyCol(party: .defaultModel)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 32)
                        
                        LargeDivider()
                        
                        // 근처 주문
                        HStack(spacing: 2) {
                            Text("공학관 ")
                                .pretendard(size: .l,
                                            weight: .semibold)
                                .foregroundStyle(Color.mainColor)
                            
                            Text("근처 주문")
                                .pretendard(size: .l,
                                            weight: .semibold)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 28)
                        .padding(.bottom, 32)
                        
                        ForEach(parties, id: \.id) { party in
                            NavigationLink {
                                PartyDetailView(party: party)
                            } label: {
                                VStack() {
                                    PartyRow()
                                        .padding(.bottom, 24)
                                    Divider()
                                        .padding(.bottom, 24)
                                }
                                .padding(.horizontal, 24)
                            }
                            
                        }
                    }
                }
            }
            .padding(.top, 64)
            
            // header section
            SelectPlace(selectedPlace: $selectedPlace)
        }
    }
    
    //MARK: - home header view
    var header: some View {
        HStack {
            Button {
                // select place view
            } label: {
                Image("map.pin")
                    .renderingMode(.template)
                    .resizable()
                    .colorMultiply(.mainColor)
                    .frame(width: 24, height: 24)
            }
            
            Text("공학관")
                .pretendard(size: .ms,
                            weight: .semibold)
            
            Spacer()
            
            Button {
                
            } label: {
                Image("bell")
            }
        }
        .padding(.horizontal, 24)
        .frame(height: 64)
    }
    
}

//MARK: - PartyRow
struct PartyRow: View {
    var party: Party = .defaultModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(party.name)")
                    .pretendard(size: .l,
                                weight: .semibold)
                    .foregroundStyle(Color.black)
                
                // place section
                HStack {
                    HandoutPlace(handoutPlace: party.handoutPlace)
                    
                    Divider()
                    
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
                .foregroundStyle(Color.beGray300)
                
                HStack(spacing: 2) {
                    Image("clock")
                        .frame(width:12,
                               height: 12)
                    Text("주문 시간")
                        .pretendard(size: .xs,
                                    weight: .medium)
                }
                .foregroundStyle(Color.mainColor)
                
                Text("18:15")
                    .pretendard(size: .xs,
                                weight: .medium)
                    .foregroundStyle(Color.mainColor)
            }
            Spacer()
            
            Image.placeHolder
                .resizable()
                .frame(width: 120, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(alignment: .bottomLeading) {
                    ImageBanner(restPeople: party.maxNum)
                }
        }
    }
}

//MARK: - PartyCol
struct PartyCol: View {
    var party: Party = .defaultModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image.placeHolder
                .frame(width: 150,
                       height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(alignment: .bottom) {
                    TimeChip(time: .now)
                        .padding(.bottom, 15)
                }
            
            
            Text("\(party.name)")
                .pretendard(size: .s,
                            weight: .medium)
                .foregroundStyle(Color.black)
            
            Text("남은 인원 ")
                .pretendard(size: .s,
                            weight: .medium)
                .foregroundStyle(Color.mainColor)
            +
            Text("\(party.maxNum)/\(party.maxNum)")
                .pretendard(size: .xs,
                            weight: .regular)
                .foregroundStyle(Color.beGray200)
            
            HStack(spacing: 2) {
                Image("map.pin")
                    .resizable()
                    .frame(width: 14,
                           height: 14)
                Text("\(party.handoutPlace)")
                    .pretendard(size: .xs,
                                weight: .regular)
                    .foregroundStyle(Color.beGray200)
            }
            
        }
    }
}



#Preview {
    HomeView()
}
