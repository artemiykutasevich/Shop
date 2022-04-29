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
            product.image
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: 120, height: 20, alignment: .bottom)
        }
        .frame(width: 120, height: 120, alignment: .center)
        .background(.blue, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ProductModel(image: Image(systemName: "mic"), name: "banan", productType: .fruits, body: "very ymmy", price: 10.2))
    }
}
