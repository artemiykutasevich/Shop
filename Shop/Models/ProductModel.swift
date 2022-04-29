//
//  ProductModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct ProductModel: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
    let productType: ProductType
    let body: String
    let price: Double
}
