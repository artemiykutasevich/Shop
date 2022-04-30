//
//  MenuView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()
    @State private var selectedCategory: CategoryType = .all
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Выбранная категория")
                        .font(.body)
                        .fontWeight(.bold)
                    Spacer()
                    Picker("", selection: $selectedCategory) {
                        ForEach(CategoryType.allCases) { category in
                            Text(category.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                
                ForEach(viewModel.products) { product in
                    if selectedCategory == .all {
                        NavigationLink(destination: DetailView(product: product)) {
                            ProductView(product: product)
                                .foregroundColor(.primary)
                        }
                        .padding([.leading, .trailing])
                    } else if selectedCategory.rawValue == product.productType.rawValue {
                        NavigationLink(destination: DetailView(product: product)) {
                            ProductView(product: product)
                                .foregroundColor(.primary)
                        }
                        .padding([.leading, .trailing])
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .padding([.leading, .trailing])
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
