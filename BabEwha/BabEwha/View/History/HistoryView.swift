//
//  HistoryView.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

struct HistoryView: View {
    @State var isActiveNameView: Bool = false
    
    var currentParty: Party? = .defaultModel
    var party: Party {
        currentParty == nil ? .defaultModel : currentParty!
    }
    @State var process: Process = .모집중
    var body: some View {
        VStack {
            header
                .padding(.horizontal, 24)
            if currentParty == nil {
                Spacer()
                emptyView
                    .padding(.horizontal, 24)
            } else {
                contentView
                    .padding(.bottom, 24)
                    .padding(.horizontal, 24)
                
                LargeDivider()
                
                BEProcessView(party: party,
                              selectedProcess: $process,
                              isActiveNameView: $isActiveNameView)
                
            }
            
            Spacer()
        }
        .navigationDestination(isPresented: $isActiveNameView) {
            DepositView(isActiveSuperView: $isActiveNameView,
                        party: party)
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
    
    //MARK: - emptyView
    private var emptyView: some View {
        VStack {
            Image("empty")
                .padding(.bottom, 40)
            
            Text("진행 중인 배달이 없어요")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 12)
            
            Text("지금 바로 모임을 만들어 보세요")
                .pretendard(size: .s,
                            weight: .regular)
        }
    }
    
    //MARK: - contentView
    private var contentView: some View {
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
    
    func refreshData() {
        
    }
}

#Preview {
    HistoryView(currentParty: .defaultModel)
}
