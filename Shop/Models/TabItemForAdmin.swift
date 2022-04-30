//
//  TabItemForAdmin.swift
//  Shop
//
//  Created by Artem Kutasevich on 30.04.22.
//

import Foundation

struct TabItemForAdmin: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: TabForAdmin
}

var tabItemsForAdmin = [
    TabItemForAdmin(text: "Добавление", icon: "plus.square.dashed", tab: .addProduct),
    TabItemForAdmin(text: "Заказы", icon: "doc", tab: .allOrders)
]
