//
//  View+.swift
//  BabEwha
//
//  Created by sole on 3/15/24.
//

import SwiftUI

extension View {
    /// 화면을 터치했을 때 키보드를 내리는 메서드입니다.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
