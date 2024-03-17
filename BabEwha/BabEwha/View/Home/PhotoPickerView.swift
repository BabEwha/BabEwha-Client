//
//  PhotoPickerView.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView<Label : View>: View {
    @State var picked: PhotosPickerItem?
    @Binding var image: Image?
    @ViewBuilder var label: () -> Label
    
    var body: some View {
        PhotosPicker(selection: $picked) {
            label()
        }
        .onChange(of: picked) { oldValue, newValue in
            if oldValue == newValue {
                return
            }
            guard let newValue
            else {
                image = nil
                return
            }
            Task {
                let result = await convertToImage(newValue)
                self.image = result
            }
        }
    }
    
    //MARK: - convertToImage
    /// PhotosPickerItem을 Image로 바꾸는 메서드입니다.
    func convertToImage(_ from: PhotosPickerItem) async -> Image? {
        return try? await from.loadTransferable(type: Image.self)
    }
}

#Preview {
    PhotoPickerView(image: .constant(nil)) {
        HStack {
            Text("갤러리")
                .pretendard(size: .s,
                            weight: .regular)
                .foregroundStyle(Color.black)
            Spacer()
        }
    }
}
