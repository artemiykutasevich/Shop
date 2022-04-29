//
//  BasketView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct BasketView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.basket) { element in
                Text(element.name)
            }
        }
        .onAppear() {
            viewModel.setUpBasket()
        }
        .navigationTitle("Basket")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
