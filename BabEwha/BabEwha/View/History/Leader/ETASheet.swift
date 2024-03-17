//
//  ETASheet.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

struct ETASheet: View {
    @State var selectedDate: Date = .now
    @State var isPresentedReceiptSheet: Bool = false
    @State var isActiveDateSheet: Bool = false
    @Binding var isActiveETASheet: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("예상 배달 시간")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 12)
            
            Text("배달 도착 예정 시간을 적어주세요")
                .pretendard(size: .s,
                            weight: .regular)
                .foregroundStyle(Color.beGray200)
                .padding(.bottom, 24)
            
            HStack {
                Spacer()
                Button {
                    isActiveDateSheet = true
                } label: {
                    TimeLabel(time: "\(selectedDate.hour):\(selectedDate.minute)")
                        .foregroundStyle(Color.black)
                }
                Spacer()
            }
            .padding(.bottom, 10)
            
            BEButton(style: .plain) {
                isPresentedReceiptSheet = true
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }

        }
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $isPresentedReceiptSheet) {
            ReceiptUploadSheet(isActiveETASheet: $isActiveETASheet,
                               date: $selectedDate)
        }
        .sheet(isPresented: $isActiveDateSheet) {
            VStack {
                DatePicker(selection: $selectedDate,
                           displayedComponents: .hourAndMinute) {
                }
                .datePickerStyle(WheelDatePickerStyle())
                .padding(.trailing, 40)
            }
            .frame(maxWidth: .infinity)
            .environment(\.locale, .init(identifier: "de"))
            .presentationDetents([.fraction(0.5)])
        }
    }
}


struct ReceiptUploadSheet: View {
    @State var photo: Image?
    @State var isPresentedConfirmSheet: Bool = false
    @Binding var isActiveETASheet: Bool
    @Binding var date: Date
    var body: some View {
        VStack(alignment: .leading) {
            Text("영수증 업로드")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 12)
            
            Text("영수증 사진을 캡쳐해 업로드 해주세요")
                .pretendard(size: .s,
                            weight: .regular)
                .foregroundStyle(Color.beGray200)
                .padding(.bottom, 24)
            
         
            
            if photo == nil {
                PhotoPickerView(image: $photo) {
                    Text("업로드")
                        .pretendard(size: .ms,
                                    weight: .semibold)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 20)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
          
            } else {
                BEButton(style: .plain) {
                    isPresentedConfirmSheet = true
                } label: {
                    Text("다음")
                        .frame(maxWidth: .infinity)
                }
            }
            
    
        }
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $isPresentedConfirmSheet) {
            ETAConfirmSheet(date: $date,
                            photo: $photo,
                            isActiveETASheet: $isActiveETASheet)
        }
        .navigationBarBackButtonHidden()
        
    }
}


struct ETAConfirmSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var date: Date
    @Binding var photo: Image?
    @Binding var isActiveETASheet: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("예상 배달 시간")
                .pretendard(size: .l,
                            weight: .semibold)
                .padding(.bottom, 12)
            
            HStack {
                TimeLabel(time: "\(date.hour):\(date.minute)")
                
                Spacer()
                
                photo?
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            
            BEButton(style: .plain) {
                isActiveETASheet = false
//                dismiss()
            } label: {
                VStack {
                    Text("정산하기")
                        .pretendard(size: .l,
                                    weight: .semibold)
                    Text("참여벗에게 정산을 요청해요!")
                        .pretendard(size: .s,
                                    weight: .regular)
                }
                .frame(maxWidth: .infinity)
            }

        }
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden()
    }
}


struct TimeLabel: View {
    
    var time: String = ""
    
    var body: some View {
        HStack {
            Text(time)
                .pretendard(size: .l,
                            weight: .regular)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 54)
        .background(Color.beGray100)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.beGray300)
        }
    }
}

#Preview {
    ETASheet(isActiveETASheet: .constant(false))
}
