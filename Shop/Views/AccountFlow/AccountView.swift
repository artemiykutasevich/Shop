//
//  AccountView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .background(.blue, in: RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.white)
                        .frame(height: 100)
                    Text("Name")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Text("Корзина")
                
                Button(action: {
                    viewModel.exitFromAccount()
                }, label: {
                    Text("Выйти из аккаунта")
                        .foregroundColor(.red)
                })
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
