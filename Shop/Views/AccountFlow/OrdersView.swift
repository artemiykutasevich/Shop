//
//  OrdersView.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import SwiftUI

struct OrdersView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.orders) { order in
                Text("Заказ номер: \(order.id)")
                    .font(.body)
                    .foregroundColor(Color("Color-4"))
            }
            .listRowBackground(Color("Color"))
        }
        .navigationTitle("Orders")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
