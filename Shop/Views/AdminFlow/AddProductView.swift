//
//  AddProductView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AddProductView: View {
    @StateObject private var viewModel = AddProductViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("product name", text: $viewModel.nameTextField)
                    .styleTextField()
                TextField("product description", text: $viewModel.bodyTextField)
                    .styleTextField()
                TextField("product price", text: $viewModel.priceTextField)
                    .styleTextField()
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
                        .styleButton(color: Color("Color-2"))
                })
                
                Button(action: {
                    viewModel.exitFromAdmin()
                }, label: {
                    Text("Exit")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color-1"))
                        .styleButton(color: Color("Color-1"))
                })
            }
            .navigationTitle("Add new product")
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
