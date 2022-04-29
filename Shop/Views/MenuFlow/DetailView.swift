//
//  DetailView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct DetailView: View {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    @State private var showingAlert = false
    
    let databaseManager = DatabaseManager.databaseManager
    
    let product: ProductModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Image(product.imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(25)
                
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(product.price.description) $")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(product.productType.rawValue)
                    .font(.body)
                
                Spacer()
                
                Text(product.body)
                    .font(.body)
                
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 110)
            }
            
            Button(action: {
                addToBasket()
                showingAlert = true
            }, label: {
                Text("Положить в корзину")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .styleButton(color: .gray)
            })
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .offset(y: -60)
        }
        .alert("Товар добавлен в корзину", isPresented: $showingAlert) {
            Button("Good", role: .cancel) {}
        }
        .navigationTitle("About \(product.name)")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("Color-4").ignoresSafeArea())
    }
    
    func addToBasket() {
        databaseManager.addToBasket(
            for: UUID(uuidString: activeUserID)!,
            product: product.id)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(product: ProductModel(
            id: UUID(),
            imageName: .fruits,
            name: "banana",
            productType: .fruits,
            body: "very yummy product",
            price: 10.0))
    }
}
