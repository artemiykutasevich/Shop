//
//  ProductView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct ProductView: View {
    let product: ProductModel
    
    var body: some View {
        ZStack {
            Image(product.imageName.rawValue)
                .resizable()
                .scaledToFill()
                .frame(height: 70)
                .blur(radius: 5)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(lineWidth: 1, antialiased: false))
            
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(height: 70, alignment: .center)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ProductModel(imageName: .fruits, name: "banana", productType: .fruits, body: "very ymmy", price: 10.2))
    }
}
