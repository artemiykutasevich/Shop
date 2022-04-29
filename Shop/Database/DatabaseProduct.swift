//
//  DatabaseProduct.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation
import RealmSwift

class DatabaseProduct: Object, Identifiable {
    @Persisted var id: UUID
    @Persisted var imageName: String
    @Persisted var name: String
    @Persisted var productType: String
    @Persisted var body: String
    @Persisted var price: Double
}
