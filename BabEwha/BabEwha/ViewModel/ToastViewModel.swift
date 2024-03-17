//
//  ToastViewModel.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var isProcessing: Bool = false
    @Published var isCompleted: Bool = false
    @Published var isError: Bool = false
}
