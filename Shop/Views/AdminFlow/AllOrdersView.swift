//
//  AllOrdersView.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import SwiftUI

struct AllOrdersView: View {
    @StateObject private var viewModel = AdminViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.orders) { order in
                    VStack {
                        Text("Заказ номер: \(order.id.description)")
                        Text("Продукты: \(order.products.description)")
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .navigationTitle("All orders")
            .background(Color("Color"))
            .onAppear() {
                viewModel.setUpOrders()
            }
        }
    }
}

struct AllOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AllOrdersView()
    }
}
