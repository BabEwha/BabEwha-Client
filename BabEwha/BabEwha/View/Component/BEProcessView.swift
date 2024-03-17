//
//  BEProcessView.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

enum Process: String, CaseIterable {
    case 모집중 = "모집 중"
    case 주문완료 = "주문 완료"
    case 정산완료 = "정산 완료"
    case 배달진행중 = "배달 진행 중"
    case 배달도착 = "배달 도착"
}

struct BEProcessView: View {
    let party: Party
    @Binding var selectedProcess: Process
    @Binding var isActiveNameView: Bool
    
    var body: some View {
        VStack(spacing: 14) {
            processSwitchView
        }
        .padding(.horizontal, 24)
    }
    
    var processSwitchView: some View {
        switch selectedProcess {
        case .모집중:
            return AnyView(
                Image("모집중")
//                VStack(spacing: 16) {
//                    HStack {
//                        ProcessCircle(process: .모집중,
//                                      selectedProcess: $selectedProcess)
//                        
//                        ProcessChip(process: .모집중,
//                                    selectedProcess: $selectedProcess)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .주문완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .주문완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                }
            )
        case .주문완료:
            return AnyView(
                VStack(spacing: 16) {
//                    HStack {
//                        ProcessCircle(process: .모집중,
//                                      selectedProcess: $selectedProcess)
//                        
//                        ProcessChip(process: .모집중,
//                                    selectedProcess: $selectedProcess)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .주문완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .주문완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
                    Image("주문완료")
                    
                    BEButton(style: .plain) {
                        // navigation to
                        isActiveNameView = true
                    } label: {
                        VStack {
                            Text("정산하기")
                                .pretendard(size: .l,
                                            weight: .bold)
                            Text("리더벗이 입금을 요청했어요")
                                .pretendard(size: .xs,
                                            weight: .regular)
                        }
                        .frame(maxWidth: .infinity)
                    }

                }
            )
        case .정산완료:
            return AnyView(
                Image("정산완료")
//                VStack(spacing: 16) {
//                    HStack {
//                        ProcessCircle(process: .모집중,
//                                      selectedProcess: $selectedProcess)
//                        
//                        ProcessChip(process: .모집중,
//                                    selectedProcess: $selectedProcess)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .주문완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .주문완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .정산완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .정산완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                }
            )
        case .배달진행중:
            return AnyView(
                VStack(alignment: .leading) {
                    Image("배달진행중")
                    HStack {
                        Text("도착 예상시간")
                            .pretendard(size: .xs,
                                        weight: .regular)
                            
                        Text("18시 35분")
                            .pretendard(size: .xs,
                                        weight: .semibold)
                            
                    }
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .background(Color.mainColor)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.leading, 70)
                }
//                VStack(spacing: 16) {
//                    HStack {
//                        ProcessCircle(process: .모집중,
//                                      selectedProcess: $selectedProcess)
//                        
//                        ProcessChip(process: .모집중,
//                                    selectedProcess: $selectedProcess)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .주문완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .주문완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .정산완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .정산완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .배달진행중,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .배달진행중,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                }
            )
        case .배달도착:
            return AnyView(
                Image("배달도착")
//                VStack(spacing: 16) {
//                    HStack {
//                        ProcessCircle(process: .모집중,
//                                      selectedProcess: $selectedProcess)
//                        
//                        ProcessChip(process: .모집중,
//                                    selectedProcess: $selectedProcess)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .주문완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .주문완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .정산완료,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .정산완료,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .배달진행중,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .배달진행중,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                    
//                    HStack {
//                        ProcessCircle(process: .배달도착,
//                                      selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                        
//                        ProcessChip(process: .배달도착,
//                                    selectedProcess: $selectedProcess)
//                        .foregroundColor(Color.gray)
//                    }
//                }
            )
        }
    }
}

//MARK: - ProcessChip
struct ProcessChip: View {
    let process: Process
    @Binding var selectedProcess: Process
    
    var isSelected: Bool {
        process == selectedProcess
    }
    
    var color: Color {
        isSelected ? .mainColor : .subColor100
    }
    
    private var imageName: String {
        switch process {
        case .모집중:
            return "people"
        case .주문완료:
            return "smartphone"
        case .정산완료:
            return "smartphone"
        case .배달진행중:
            return "delivery"
        case .배달도착:
            return "dishes"
        }
    }
    
    private var status: String {
        switch process {
        case .모집중:
            return "클릭하면 배달 어플로 넘어가요"
        case .주문완료:
            return "리더벗이 배달 주문을 완료했어요"
        case .정산완료:
            return "리더벗이 입금을 확인했어요"
        case .배달진행중:
            return "도착을 기다리고 있어요"
        case .배달도착:
            return "신공학관 1층 정문"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(imageName)
                    .renderingMode(.template)
                    .foregroundStyle(color)
                
                VStack(alignment: .leading) {
                    Text("\(process.rawValue)")
                        .pretendard(size: .ms,
                                    weight: .semibold)
                    
                    Text(status)
                        .pretendard(size: .xs,
                                    weight: .regular)
                }
                .foregroundStyle(color)
                
                Spacer()
            }
            
            if process == .배달진행중 {
                HStack {
                    Text("도착 예상시간")
                        .pretendard(size: .xs,
                                    weight: .regular)
                        
                    Text("18시 35분")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                        
                }
                .foregroundStyle(Color.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(Color.mainColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.leading, 50)
            }
        }
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 1)
        }
        
    }
}

//MARK: - ProcessCircle
struct ProcessCircle: View {
    let process: Process
    @Binding var selectedProcess: Process
    
    var isSelected: Bool {
        process == selectedProcess
    }
    
    var body: some View {
        if isSelected {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(Color.mainColor)
                .frame(width: 26, height: 26)
        } else {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundStyle(Color.subColor100)
                .frame(width: 26, height: 26)
        }
    }
}



#Preview {
    BEProcessView(party: .defaultModel, selectedProcess: .constant(.모집중),
                  isActiveNameView: .constant(false))
}
