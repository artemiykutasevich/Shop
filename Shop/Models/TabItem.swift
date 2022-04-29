//
//  TabItem.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import Foundation

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(text: "Меню", icon: "cart", tab: .menu),
    TabItem(text: "Аккаунт", icon: "person", tab: .account)
]
