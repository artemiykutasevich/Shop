//
//  DetailView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct DetailView: View {
    let product: ProductModel
    
    var body: some View {
        ScrollView {
            product.image
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .background(.blue)
            
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(product.price.description) $")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text(product.productType.rawValue)
                .font(.body)
            
            Text(product.body)
                .font(.body)
            
            Button(action: {
                // добавить в корзину
            }, label: {
                Text("Положить в корзину")
                    .foregroundColor(.primary)
            })
            .styleButton(color: .gray)
        }
        .navigationTitle("About")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(product: ProductModel(
            image: Image(systemName: "mic"),
            name: "banana",
            productType: .fruits,
            body: "very yummy product",
            price: 10.0))
    }
}
