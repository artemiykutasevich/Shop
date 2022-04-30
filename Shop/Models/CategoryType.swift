//
//  CategoryType.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import Foundation

enum CategoryType: String, CaseIterable, Identifiable {
    var id: CategoryType { self }
    
    case all
    case fruits
    case vegetables
    case other
}
