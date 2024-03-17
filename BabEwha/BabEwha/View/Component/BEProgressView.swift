//
//  BEProgressView.swift
//  Ewhaton
//
//  Created by sole on 3/15/24.
//

import SwiftUI

// FIXME: Rounded 처리
struct BEProgressView: View {
    @State var angle: Double = 0
    
    let timer = Timer.publish(every: 0.12,
                                     on: .main,
                                     in: .common)
                .autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.backgroundGray)
            Circle()
                .stroke(Color.beGray100, lineWidth: 6)
                .frame(width: 48,
                       height: 48)
                .overlay {
                    Circle()
                        .trim(from: 0,
                              to: 0.25)
                        .stroke(Color.mainColor, lineWidth: 6)
                        .rotationEffect(.degrees(angle)
                        )
                }
                .padding(20)
            // FIXME: color change
                .background(Color.backgroundGray)
                .cornerRadius(8)
                .onReceive(timer) { _ in
                    withAnimation {
                        // FIXME: angle 값 초기화 필요
                        angle += 90
                    }
                }
            
        }
    }
}

#Preview {
    ZStack {
        BEProgressView()
    }
}
