//
//  MenuView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    
    let element = ProductModel(
        image: Image(systemName: "mic"),
        name: "banana",
        productType: .fruits,
        body: "very yummy",
        price: 10.0)
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: DetailView(product: element)) {
                    ProductView(product: element)
                        .foregroundColor(.primary)
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .background(Color("Color-4").ignoresSafeArea())
            .navigationTitle("Shop")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
