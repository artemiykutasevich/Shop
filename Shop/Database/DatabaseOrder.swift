//
//  DatabaseOrder.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import Foundation
import RealmSwift

class DatabaseOrder: Object, Identifiable {
    @Persisted var uuid: UUID
    @Persisted var dateOfOrder: Date
    
    @Persisted var products: List<DatabaseProduct>
}
