//
//  AccountViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    
    let databaseManager = DatabaseManager.databaseManager
    
    func exitFromAccount() {
        activeUserID = ""
    }
}
