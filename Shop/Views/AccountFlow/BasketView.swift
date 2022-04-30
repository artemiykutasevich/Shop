//
//  BasketView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct BasketView: View {
    @StateObject private var viewModel = AccountViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        List {
            ForEach(viewModel.basket) { element in
                Text(element.name)
                    .font(.body)
                    .foregroundColor(Color("Color-4"))
            }
            .listRowBackground(Color("Color"))
            
            Section {
                Button(action: {
                    showingSheet = true
                }, label: {
                    Text("Оплатить")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color-4"))
                })
                .listRowBackground(Color("Color-1"))
            }
        }
        .alert("Офрмить заказ", isPresented: $showingSheet) {
            Button("Нет", role: .destructive) {}
            Button("Оформит", role: .cancel) {
                viewModel.payForGoods()
            }
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
