//
//  ContentView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    @AppStorage("selectedTab") private var selectedTab: Tab = .menu
    @AppStorage("selectedTabForAdmin") var selectedTabForAdmin: TabForAdmin = .addProduct
    
    var body: some View {
        ZStack {
            if activeUserID == "" {
                AuthorizationView()
            } else if activeUserID == "Admin" {
                Group {
                    switch selectedTabForAdmin {
                    case .addProduct:
                        AddProductView()
                    case .allOrders:
                        AllOrdersView()
                    }
                }
                TabBarForAdmin()
            } else {
                Group {
                    switch selectedTab {
                    case .menu:
                        MenuView()
                    case .account:
                        AccountView()
                    }
                }
                TabBar()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
