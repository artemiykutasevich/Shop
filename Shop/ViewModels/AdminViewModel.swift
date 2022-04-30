//
//  AdminViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

class AdminViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    
    @Published var nameTextField = ""
    @Published var bodyTextField = ""
    @Published var priceTextField = ""
    @Published var selectedType: ProductType = .other
    
    @Published var orders = [OrderModel]()
    
    let databaseManager = DatabaseManager.databaseManager
    
    func setUpOrders() {
        let savedOrders = databaseManager.savedOrders
        orders = []
        
        for element in savedOrders {
            let order = OrderModel(
                id: element.uuid,
                dateOfOrder: element.dateOfOrder,
                listOfProducts: element.products)
            orders.append(order)
        }
    }
    
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
