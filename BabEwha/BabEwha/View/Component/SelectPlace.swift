//
//  SelectPlace.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI

enum Place: String, CaseIterable {
    case 공학관
    case 연구협력관
    case 종합과학관
    case 한우리집
    case 이하우스
    case 아이하우스
    case 교육관
    case 학관
    case 포스코관
    case 학문관
    case 법학관
}

struct SelectPlace: View {
    @State var isSheetActive: Bool = false
    @Binding var selectedPlace: Place
    var body: some View {
        VStack(spacing: 0) {
            header
            
            if isSheetActive {
                ForEach(Place.allCases, id: \.self) { place in
                    Button{
                        selectedPlace = place
                    } label: {
                        Text(isSheetActive ? place.rawValue : "")
                            .pretendard(size: .ms, weight: .bold)
                            .foregroundStyle(selectedPlace == place ? Color.black: Color.beGray300)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(selectedPlace == place ? Color.lightGray : Color.white)
                    }
                }
            }
            Rectangle()
                .foregroundStyle(isSheetActive ? Color.backgroundGray : Color.clear)
                .onTapGesture {
                    isSheetActive = false
                }
        }
    }
    
    //MARK: - header
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
            
            Text(selectedPlace.rawValue)
                .pretendard(size: .ms,
                            weight: .semibold)
            
            Button {
                // select place view
                withAnimation {
                    isSheetActive.toggle()
                }
            } label: {
                Image(systemName: isSheetActive ? "chevron.down" : "chevron.up")
                    .foregroundStyle(Color.black)
                    .frame(width: 24, height: 24)
            }
            
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

#Preview {
    SelectPlace(selectedPlace: .constant(.공학관))
}
