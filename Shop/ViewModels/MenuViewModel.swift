//
//  MenuViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation

class MenuViewModel: ObservableObject {
    @Published var products = [ProductModel]()
    
    private let databaseManager = DatabaseManager.databaseManager
    
    func setUpProducts() {
        products = []
        for element in databaseManager.savedProducts {
            let product = ProductModel(
                id: element.uuid,
                imageName: getProductType(from: element.imageName),
                name: element.name,
                productType: getProductType(from: element.productType),
                body: element.body,
                price: element.price)
            products.append(product)
        }
    }
    
    private func getProductType(from string: String) -> ProductType {
        var result = ProductType.other
        for type in ProductType.allCases {
            if type.rawValue == string {
                result = type
            }
        }
        return result
    }
}
