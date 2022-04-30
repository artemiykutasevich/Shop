//
//  AccountView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color-4"))
    }
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .background(Color("Color-3"), in: RoundedRectangle(cornerRadius: 20))
                            .foregroundColor(Color("Color-2"))
                            .frame(height: 100)
                        Text("Name")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Basket: \(viewModel.getBasketValue().description)$")
                    }
                    Spacer()
                }
                .padding()
                .listRowBackground(Color("Color-1"))
                
                Section {
                    NavigationLink(destination: BasketView()) {
                        Text("Корзина")
                            .fontWeight(.semibold)
                    }
                    
                    NavigationLink(destination: OrdersView()) {
                        Text("Мои заказы")
                            .fontWeight(.semibold)
                    }
                    
                    Button(action: {
                        viewModel.exitFromAccount()
                    }, label: {
                        Text("Выйти из аккаунта")
                            .fontWeight(.light)
                            .foregroundColor(.red)
                    })
                }
                .listRowBackground(Color("Color-1"))
                .listRowSeparatorTint(Color("Color-4"))
            }
            .onAppear() {
                viewModel.setUpBasket()
            }
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
