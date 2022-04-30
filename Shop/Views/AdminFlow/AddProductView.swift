//
//  AddProductView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AddProductView: View {
    @StateObject private var viewModel = AdminViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("product name", text: $viewModel.nameTextField)
                    .graffitiTextFieldStyle()
                TextField("product description", text: $viewModel.bodyTextField)
                    .graffitiTextFieldStyle()
                TextField("product price", text: $viewModel.priceTextField)
                    .graffitiTextFieldStyle()
                Picker("", selection: $viewModel.selectedType) {
                    ForEach(ProductType.allCases) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Button(action: {
                    viewModel.addProduct()
                }, label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color-2"))
                        .graffitiButtonStyle(color: Color("Color-2"))
                })
                
                Button(action: {
                    viewModel.exitFromAdmin()
                }, label: {
                    Text("Exit")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color-1"))
                        .graffitiButtonStyle(color: Color("Color-1"))
                })
            }
            .navigationTitle("Add new product")
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .background(Color("Color-4"))
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
