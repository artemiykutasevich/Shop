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
    
    @State var value = 1
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Group {
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
                }
                
                Spacer()
                
                Text(product.body)
                    .font(.body)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        if value > 1 {
                            value -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20, alignment: .center)
                            .graffitiButtonStyle(color: Color("Color-2"))
                    })
                    
                    Text("\(value)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        value += 1
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20, alignment: .center)
                            .graffitiButtonStyle(color: Color("Color-2"))
                    })
                }
                Text("Количество элементов в заказе")
                
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 110)
            }
            
            Button(action: {
                for _ in 1...value {
                    addToBasket()
                }
                showingAlert = true
            }, label: {
                Text("Положить в корзину")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .graffitiButtonStyle(color: Color("Color"))
            })
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .offset(y: -60)
        }
        .alert("Товар добавлен в корзину", isPresented: $showingAlert) {
            Button("Good", role: .cancel) { value = 1 }
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
