//
//  MenuView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.products) { product in
                    NavigationLink(destination: DetailView(product: product)) {
                        ProductView(product: product)
                            .foregroundColor(.primary)
                    }
                    .padding([.leading, .trailing])
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .background(Color("Color-4").ignoresSafeArea())
            .navigationTitle("Shop")
        }
        .onAppear() {
            viewModel.setUpProducts()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
