//
//  ButtonStyles.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct ButtonStyles: ViewModifier {
    var cornerRadius: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.ultraThinMaterial)
                    .shadow(color: color, radius: 0, x: 3, y: 3)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(lineWidth: 2, antialiased: true)
                    .foregroundColor(.black)
            )
            .padding(.leading)
            .padding(.trailing)
    }
}

extension View {
    func graffitiButtonStyle(cornerRadius: CGFloat = 20, color: Color) -> some View {
        self.modifier(ButtonStyles(cornerRadius: cornerRadius, color: color))
    }
}
