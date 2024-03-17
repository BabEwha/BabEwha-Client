//
//  DepositView.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

// 입금(정산) 뷰
struct DepositView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isActiveSuperView: Bool
    let party: Party
    @State var isActiveNameSheet: Bool = false
    
    var body: some View {
        VStack {
            BENavigationBar(backButton: true,
                            title: "정산")
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
            
            ScrollView {
                Button {
                    // active 영수증 확인 sheet
                } label: {
                    sectionOfImage
                        .padding(.top, 5)
                        .padding(.bottom, 32)
                }
                
                Divider()
                    .padding(.bottom, 32)
                
                sectionOfReceipt
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                
                Divider()
                    .padding(.bottom, 32)
                
                sectionOfTotal
                    .padding(.horizontal, 24)
                    .padding(.bottom, 32)
                
                sectionOfAccount
                    .padding(.horizontal, 24)
                    .padding(.bottom, 64)
                
                BEButton(style: .plain) {
                    // active 입금자명 입력 sheet
                    isActiveNameSheet = true
                } label: {
                    Text("입금완료")
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 24)

            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isActiveNameSheet) {
            NameView(isActiveSuperView: $isActiveSuperView)
                .presentationDetents([.fraction(0.4)])
        }
        
    }
    
    private var sectionOfImage: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("영수증 확인")
                    .pretendard(size: .l,
                                weight: .semibold)
                    .padding(.bottom, 8)
                    .foregroundStyle(Color.black)
                
                Text("리더벗이 올린 영수증을 확인해요")
                    .pretendard(size: .s,
                                weight: .regular)
                    .foregroundStyle(Color.beGray200)
            }
            
            Image.placeHolder
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(16)
        .background(Color.beGray100)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.beGray200)
        }
    }
    
    private var sectionOfReceipt: some View {
        VStack(alignment: .leading,
               spacing: 40) {
            VStack(alignment: .leading,
                   spacing: 8) {
                Text("주문금액")
                    .pretendard(size: .s,
                                weight: .semibold)
                    .padding(.bottom, 8)
                
                HStack {
                    Text("햄치즈버거 x1")
                        .pretendard(size: .xs,
                                    weight: .regular)
                    Spacer()
                    
                    Text("\(5500)원")
                        .pretendard(size: .xs,
                                    weight: .regular)
                }
                
                HStack {
                    Text("총 주문금액")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Spacer()
                    
                    Text("\(5500)원")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                }
                .foregroundStyle(Color.mainColor)
            }
            
            VStack(alignment: .leading,
                   spacing: 8) {
                Text("할인금액")
                    .pretendard(size: .s,
                                weight: .semibold)
                    .padding(.bottom, 8)
                
                HStack {
                    Text("퍼센트(%) 쿠폰")
                        .pretendard(size: .xs,
                                    weight: .regular)
                    Spacer()
                    
                    Text("\(-900)원")
                        .pretendard(size: .xs,
                                    weight: .regular)
                }
                
                HStack {
                    Text("정액(원) 쿠폰")
                        .pretendard(size: .xs,
                                    weight: .regular)
                    Spacer()
                    
                    Text("\(-800)원")
                        .pretendard(size: .xs,
                                    weight: .regular)
                }
            }
            
            
            VStack(alignment: .leading,
                   spacing: 8) {
                Text("배달팁")
                    .pretendard(size: .s,
                                weight: .semibold)
                    .padding(.bottom, 8)
                
                HStack {
                    Text("원래 배달팁")
                        .pretendard(size: .xs,
                                    weight: .regular)
                    Spacer()
                    
                    Text("\(2100)원")
                        .pretendard(size: .xs,
                                    weight: .regular)
                }
                
                HStack {
                    Text("내 배달팁")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                    Spacer()
                    
                    Text("\(1050)원")
                        .pretendard(size: .xs,
                                    weight: .semibold)
                }
                .foregroundStyle(Color.mainColor)
            }
        }
    }
    
    
    private var sectionOfTotal: some View {
        HStack(spacing: 24) {
            Spacer()
            
            Text("총 금액")
                .pretendard(size: .l,
                            weight: .semibold)
            
            Text("\(8350)원")
                .pretendard(size: .l,
                            weight: .semibold)
                .foregroundStyle(Color.mainColor)
        }
    }
    
    private var sectionOfAccount: some View {
        HStack {
            Text("입금 계좌")
                .pretendard(size: .s,
                            weight: .semibold)
            Spacer()
            
            Text("농협 3020860272251 엄채은")
                .pretendard(size: .s,
                            weight: .regular)
                .underline()
                .foregroundStyle(Color.blue)
        }
        .padding(16)
        .background(Color.beGray100)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.beGray200)
        }
    }
}


struct NameView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var toast: ToastViewModel = .init()
    
    @Binding var isActiveSuperView: Bool
    @State var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image("xmark")
                }
            }
            .padding(.bottom, 16)
            
            Text("입금자명")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 4)
            
            Text("리더벗의 계좌로 입금한 입금자명을 적어주세요")
                .pretendard(size: .s,
                            weight: .regular)
            
            BETextField(title: "",
                        placeHolder: "김이화",
                        style: .plain,
                        text: $name)
                .padding(.bottom, 16)
            
            BEButton(style: name.isEmpty ? .disable : .plain) {
                // send name to server
                isActiveSuperView = false
                dismiss()
            } label: {
                Text("확인")
                    .frame(maxWidth: .infinity)
            }

        }
        .padding(.horizontal, 24)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    DepositView(isActiveSuperView: .constant(false),
                party: .defaultModel)
}
