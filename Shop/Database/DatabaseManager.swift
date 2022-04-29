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
    
    private func setUp(_ databaseProduct: DatabaseProduct, from productModel: ProductModel) -> DatabaseProduct {
        databaseProduct.uuid = productModel.id
        databaseProduct.imageName = productModel.imageName.rawValue
        databaseProduct.name = productModel.name
        databaseProduct.productType = productModel.productType.rawValue
        databaseProduct.body = productModel.body
        databaseProduct.price = productModel.price
        return databaseProduct
    }
}
