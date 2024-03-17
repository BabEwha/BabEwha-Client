//
//  BETextField.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

//MARK: - BETextFieldStyle
enum BETextFieldStyle {
    case plain
    case email
    case secure
}

//MARK: - BETextField
struct BETextField: View {
    @FocusState var isFocused: Bool
    
    let title: String
    let placeHolder: String
    let style: BETextFieldStyle
    @Binding var text: String
    
    var textLineColor: Color {
        isFocused ? .mainColor : .beGray200
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 12) {
            Text(title)
                .pretendard(size: .xs,
                            weight: .regular)
                .foregroundStyle(Color.beGray200)
            
            if style == .secure {
                SecureField(text: $text) {
                    Text(placeHolder)
                }
                    .modifier(BETextFieldModifier(style: style))
                    .focused($isFocused)
                    .textInputAutocapitalization(.never)
            } else {
                TextField(text: $text) {
                    Text(placeHolder)
                }
                    .modifier(BETextFieldModifier(style: style))
                    .focused($isFocused)
                    .textInputAutocapitalization(.never)
            }
            
            TextFieldLine()
                .stroke(textLineColor)
                .frame(height: 1)
                
        }
    }
}


//MARK: - BETextFieldModifier
/// BETextFieldStyle에 따라 View 스타일을 분기처리합니다.
struct BETextFieldModifier: ViewModifier {
    let style: BETextFieldStyle
    
    func body(content: Content) -> some View {
        switch style {
        case .plain:
            content
                .accentColor(.black)
                .pretendard(size: .ms,
                            weight: .regular)
                .keyboardType(.default)
        case .email:
            content
                .accentColor(.black)
                .pretendard(size: .ms,
                            weight: .regular)
                .keyboardType(.emailAddress)
            
        case .secure:
            content
                .accentColor(.black)
                .pretendard(size: .ms,
                            weight: .regular)
                .keyboardType(.default)

        }
    }
}

//MARK: - TextFieldLine
/// TextField에서 사용되는 divider 스타일입니다.
struct TextFieldLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path: Path = .init()
        
        path.move(to: .init(x: rect.minX,
                            y: rect.minY))
        path.addLine(to: .init(x: rect.width,
                               y: rect.minY))
        
        return path
    }
}


#Preview {
    BETextField(title: "123",
                placeHolder: "비밀번호를 입력하세요",
                style: .plain,
                text: .constant(""))
}

