//
//  AddProductViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

class AddProductViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    
    @Published var nameTextField = ""
    @Published var bodyTextField = ""
    @Published var priceTextField = ""
    @Published var selectedType: ProductType = .other
    
    let databaseManager = DatabaseManager.databaseManager
    
    func addProduct() {
        let model = ProductModel(
            id: UUID(),
            imageName: selectedType,
            name: nameTextField,
            productType: selectedType,
            body: bodyTextField,
            price: Double(priceTextField) ?? 0.0)
        databaseManager.addNewProduct(productModel: model)
        
        clearFields()
    }
    
    func exitFromAdmin() {
        activeUserID = ""
    }
    
    private func clearFields() {
        nameTextField = ""
        bodyTextField = ""
        priceTextField = ""
        selectedType = .other
    }
}
