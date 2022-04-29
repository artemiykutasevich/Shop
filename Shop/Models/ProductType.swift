//
//  ProductType.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation

enum ProductType: String, CaseIterable, Identifiable {
    var id: ProductType { self }
    
    case fruits
    case vegetables
    case other
}
