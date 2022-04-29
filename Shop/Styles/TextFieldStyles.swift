//
//  TextFieldStyles.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct TextFieldStyles: ViewModifier {
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: 2, antialiased: true)
                    .foregroundColor(.black)
            )
            .padding(.leading)
            .padding(.trailing)
    }
}

extension TextField {
    func styleTextField(cornerRadius: CGFloat = 20) -> some View {
        self.modifier(TextFieldStyles(cornerRadius: cornerRadius))
    }
}
