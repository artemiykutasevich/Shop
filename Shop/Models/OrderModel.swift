//
//  OrderModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import Foundation
import RealmSwift

struct OrderModel: Identifiable {
    let id: UUID
    let dateOfOrder: Date
    var products: [ProductModel]
    
    init(id: UUID, dateOfOrder: Date, listOfProducts: List<DatabaseProduct>) {
        self.id = id
        self.dateOfOrder = dateOfOrder
        self.products = [ProductModel]()
        
        for element in listOfProducts {
            let product = ProductModel(
                id: element.uuid,
                imageName: getProductType(from: element.productType),
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
