//
//  AccountViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI
import RealmSwift

class AccountViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    @Published var basket = [ProductModel]()
    @Published var orders = [OrderModel]()
    
    private let databaseManager = DatabaseManager.databaseManager
    
    init() {
        setUpBasket()
        setUpOrders()
    }
    
    func payForGoods() {
        databaseManager.makeOrder(for: UUID(uuidString: activeUserID) ?? UUID())
        setUpBasket()
    }
    
    func setUpBasket() {
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
    
    func setUpOrders() {
        let list = databaseManager.getOrders(for: UUID(uuidString: activeUserID) ?? UUID())
        orders = []
        
        for element in list {
            let order = OrderModel(
                id: element.uuid,
                dateOfOrder: element.dateOfOrder,
                listOfProducts: element.products)
            orders.append(order)
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
