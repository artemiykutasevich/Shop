//
//  DatabaseManager.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static var databaseManager = DatabaseManager()
    private init() { /* Singleton */ }
    
    private let realm = try! Realm()
    
    @ObservedResults(DatabaseUser.self) var savedUsers
    @ObservedResults(DatabaseProduct.self) var savedProducts
    @ObservedResults(DatabaseOrder.self) var savedOrders
    
    func registration(login: String, password: String) {
        let user = DatabaseUser()
        user.login = login
        user.password = password
        
        try! realm.write {
            realm.add(user)
        }
    }
    
    func authorization(login: String, password: String) -> Bool {
        guard realm.objects(DatabaseUser.self).where({$0.login == login && $0.password == password}).first != nil else { return false }
        return true
    }
    
    func getUserID(login: String, password: String) -> UUID {
        let user = realm.objects(DatabaseUser.self).where({$0.login == login && $0.password == password}).first!
        return user.uuid
    }
    
    func addNewProduct(productModel: ProductModel) {
        let databaseProduct = DatabaseProduct()
        let obj = setUp(databaseProduct, from: productModel)
        
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func addToBasket(for user: DatabaseUser, product: DatabaseProduct) {
        try! realm.write {
            user.basket.append(product)
        }
    }
    
    func addToBasket(for userID: UUID, product productID: UUID) {
        let user = findDatabaseUser(by: userID)
        let product = findDatabaseProduct(by: productID)
        
        try! realm.write {
            user.basket.append(product)
        }
    }
    
    func getBasket(for user: DatabaseUser) -> List<DatabaseProduct> {
        return user.basket
    }
    
    func getBasket(for userID: UUID) -> List<DatabaseProduct> {
        let user = findDatabaseUser(by: userID)
        return user.basket
    }
    
    func makeOrder(for userID: UUID) {
        let user = findDatabaseUser(by: userID)
        let basket = getBasket(for: userID)
        
        let order = DatabaseOrder()
        order.uuid = UUID()
        order.dateOfOrder = Date()
        order.products = basket
        
        try! realm.write {
            user.orders.append(order)
            user.basket.removeAll()
        }
    }
    
    func getOrders(for userID: UUID) -> List<DatabaseOrder> {
        let user = findDatabaseUser(by: userID)
        return user.orders
    }
    
    private func setUp(_ databaseProduct: DatabaseProduct, from productModel: ProductModel) -> DatabaseProduct {
        databaseProduct.uuid = productModel.id
        databaseProduct.imageName = productModel.imageName.rawValue
        databaseProduct.name = productModel.name
        databaseProduct.productType = productModel.productType.rawValue
        databaseProduct.body = productModel.body
        databaseProduct.price = productModel.price
        return databaseProduct
    }
    
    private func findDatabaseUser(by uuid: UUID) -> DatabaseUser {
        let user = realm.objects(DatabaseUser.self).where({$0.uuid == uuid}).first!
        return user
    }
    
    private func findDatabaseProduct(by uuid: UUID) -> DatabaseProduct {
        let product = realm.objects(DatabaseProduct.self).where({$0.uuid == uuid}).first!
        return product
    }
}
