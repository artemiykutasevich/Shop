//
//  DatabaseUser.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation
import RealmSwift

class DatabaseUser: Object, Identifiable {
    @Persisted var uuid = UUID()
    @Persisted var login: String
    @Persisted var password: String
    
    @Persisted var basket = List<DatabaseProduct>()
}

