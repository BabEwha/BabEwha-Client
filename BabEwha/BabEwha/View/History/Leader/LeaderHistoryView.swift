//
//  LeaderHistoryView.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

struct LeaderHistoryView: View {
    @Environment(\.openURL) var openURL
    
    let party: Party
    @State var process: Process = .모집중
    @State var isActiveDeliveryDoneSheet: Bool = false
    @State var isActiveETASheet: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            header
                .padding(.horizontal, 24)
            
            ScrollView {
                processSwitchView
            }
            
            Spacer()
        }
        .sheet(isPresented: $isActiveDeliveryDoneSheet) {
            DeliveryDoneSheet()
                .presentationDetents([.fraction(0.45)])
        }
        .sheet(isPresented: $isActiveETASheet) {
            NavigationStack {
                ETASheet(isActiveETASheet: $isActiveETASheet)
            }
            .presentationDetents([.fraction(0.5)])
        }
    }
    
    private var processSwitchView: some View {
        switch process {
        case .모집중:
            return AnyView(
                ScrollView {
                    storeView
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    
                    
                    LargeDivider()
                    
                    Image("모집중.방장")
                    
                    LargeDivider()
                        .padding(.bottom, 24)
                    
                    PersonReceiptView()
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    
                    PersonReceiptView()
                        .padding(.horizontal, 24)
                        .padding(.bottom, 72)
                    
                    BEButton(style: .plain) {
                        openDeliveryApp(openURLAction: openURL)
                    } label: {
                        VStack {
                            Text("주문하러 가기")
                                .pretendard(size: .l,
                                            weight: .semibold)
                            Text("클릭하면 배달 어플로 넘어가요")
                                .pretendard(size: .s,
                                        weight: .regular)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    BEButton(style: .line) {
                        isActiveETASheet = true
                    } label: {
                        VStack {
                            Text("정산 요청")
                                .pretendard(size: .l,
                                            weight: .semibold)
                            Text("참여벗에게 정산을 요청해요!")
                                .pretendard(size: .s,
                                            weight: .regular)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            )
        case .주문완료:
            return AnyView(
                VStack(alignment: .leading) {
                    storeView
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    
                    
                    LargeDivider()
                    
                    Image("정산중")
                    
                    LargeDivider()
                        .padding(.bottom, 24)
                }
            )
        case .정산완료:
            return AnyView(
                VStack(alignment: .leading) {
                    storeView
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    
                    
                    LargeDivider()
                    
                    Image("정산완료")
                    
                    LargeDivider()
                        .padding(.bottom, 24)
                }
            )
        case .배달진행중:
            return AnyView(
                VStack(alignment: .leading) {
                    storeView
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    
                    
                    LargeDivider()
                    
                    Image("배달진행중.방장")
                    
                    BEButton(style: .plain) {
                        isActiveDeliveryDoneSheet = true
                    } label: {
                        VStack {
                            Text("배달 도착")
                                .pretendard(size: .l,
                                            weight: .semibold)
                            Text("참여벗에게 배달 도착 알림을 보내요")
                                .pretendard(size: .s,
                                        weight: .regular)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 24)
                }
            )
        case .배달도착:
            return AnyView(
                VStack(alignment: .leading) {
                    storeView
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    
                    
                    LargeDivider()
                    
                    Image("모집중.방장")
                    
                    LargeDivider()
                        .padding(.bottom, 24)
                }
            )
        }
    }
    
    //MARK: - contentView
    private var storeView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(party.name)")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    
                    InformationView(style: .time,
                                    content: "16:35")
                    
                    InformationView(style: .user,
                                    content: "모집완료")
                }
                Spacer()
                Image.placeHolder
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
    
    //MARK: - header
    private var header: some View {
        HStack {
            Spacer()
            
            Text("배달 현황")
                .pretendard(size: .ms,
                            weight: .semibold)
                .padding(.leading, 24)
            
            Spacer()
            
            Button {
                // refresh data
                switch process {
                case .모집중:
                    process = .주문완료
                case .주문완료:
                    process = .정산완료
                case .정산완료:
                    process = .배달진행중
                case .배달진행중:
                    process = .배달도착
                case .배달도착:
                    process = .모집중
                }
                refreshData()
            } label: {
                Image("restore")
            }
        }
        .frame(height: 64)
    }
    
    //MARK: - refreshData
    func refreshData() {
        
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

struct PersonReceiptView: View {
    var name: String = "김이화"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(name)벗")
                    .pretendard(size: .ms,
                                weight: .semibold)
                    .padding(.bottom, 6)
                
                HStack {
                    Text("햄치즈 토스트 x1")
                        .pretendard(size: .s,
                                    weight: .regular)
                    Spacer()
                    Text("\(3000)원")
                        .pretendard(size: .s,
                                    weight: .regular)
                }
                
                
                HStack {
                    Text("아메리카노 x1")
                        .pretendard(size: .s,
                                    weight: .regular)
                    Spacer()
                    Text("\(3000)원")
                        .pretendard(size: .s,
                                    weight: .regular)
                }
                
                HStack {
                    Text("총 주문금액 x1")
                        .pretendard(size: .s,
                                    weight: .semibold)
                    Spacer()
                    Text("\(3000)원")
                        .pretendard(size: .s,
                                    weight: .semibold)
                }
                .foregroundStyle(Color.mainColor)
            }
            Spacer()
            
            Image.placeHolder
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.leading, 20)
        }
    }
}

struct DeliveryDoneSheet: View {
    @Environment(\.dismiss) var dismiss
    @State var isAgree: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("배달 도착 알림")
                .pretendard(size: .l,
                            weight: .semibold)
            
            InformationView(style: .place,
                            content: "신공학관 1층 정문")
            .padding(.bottom, 24)
            
            HStack {
                BECheckBox(isOn: $isAgree)
                Text("배달 도착을 누른 후에는 되돌릴 수 없어요\n배달이 확실히 도착하였나요? ")
                    .pretendard(size: .s,
                                weight: .regular)
            }
            .onTapGesture {
                isAgree.toggle()
            }
            .padding(.bottom, 12)
            
            BEButton(style: isAgree ? .plain : .disable) {
                dismiss()
            } label: {
                VStack {
                    Text("배달 도착")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    Text("참여벗에게 배달 도착 알림을 보내요")
                        .pretendard(size: .s,
                                weight: .regular)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    LeaderHistoryView(party: .defaultModel)
}
