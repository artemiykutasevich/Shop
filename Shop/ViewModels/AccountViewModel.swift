//
//  AccountViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    @Published var basket = [ProductModel]()
    
    private let databaseManager = DatabaseManager.databaseManager
    
    init() {
        let list = databaseManager.getBasket(for: UUID(uuidString: activeUserID) ?? UUID())
        basket = []
        
        for element in list {
            let product = ProductModel(
                id: element.uuid,
                imageName: getProductType(from: element.productType),
                name: element.name,
                productType: getProductType(from: element.productType),
                body: element.body,
                price: element.price)
            basket.append(product)
        }
    }
    
    func getBasketValue() -> Double {
        var price = 0.0
        for element in basket {
            price += element.price
        }
        return price
    }
    
    func exitFromAccount() {
        activeUserID = ""
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
