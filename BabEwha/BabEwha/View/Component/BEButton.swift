//
//  BEButton.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

enum BEButtonStyle {
    case plain
    case login
    case signUp
    case findPW
    case line
    case disable
}

struct BEButton<Label: View>: View {
    let style: BEButtonStyle
    let action: () -> ()
    @ViewBuilder let label: () -> Label
    
    @State var isDisable: Bool = false
    var body: some View {
        Button(action: action) {
            label()
                .padding(.vertical, 18)
                .padding(.horizontal, 20)
                .modifier(BEButtonModifier(style: style))
                .opacity(isDisable ? 0.6 : 1.0)
        }
        .disabled(style == .disable)
    }
}

struct BEButtonModifier: ViewModifier {
    let style: BEButtonStyle
    
    func body(content: Content) -> some View {
        
        switch style {
        case .plain:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.white)
                .background(Color.mainColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
        case .login:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.mainColor)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        case .signUp:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.4)
                        .foregroundStyle(Color.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
        case .findPW:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.beGray200)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        case .line:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.mainColor)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1.4)
                        .foregroundStyle(Color.mainColor)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
        case .disable:
            content
                .pretendard(size: .ms,
                            weight: .semibold)
                .foregroundStyle(Color.white)
                .background(Color.disabledColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .opacity(0.6)
                
        }
    }
}


#Preview {
    VStack {
        BEButton(style: .plain)
        {
            
        } label: {
            Text("배달하기")
        }
        
        BEButton(style: .login)
        {
            
        } label: {
            Text("배달하기")
        }
        
        BEButton(style: .signUp)
        {
            
        } label: {
            Text("배달하기")
        }
        
        BEButton(style: .findPW)
        {
            
        } label: {
            Text("배달하기")
        }
        
        BEButton(style: .line)
        {
            
        } label: {
            Text("배달하기")
        }
        BEButton(style: .disable)
        {
            
        } label: {
            Text("배달하기")
        }

    }
    .frame(maxWidth: .infinity,
           maxHeight: .infinity)
    .background(Color.gray)
}
