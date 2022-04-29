//
//  AuthorizationViewModel.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

class AuthorizationViewModel: ObservableObject {
    @AppStorage("ActiveUserID") private var activeUserID: String = ""
    
    @Published var loginTextField = ""
    @Published var passwordTextField = ""
    
    private let databaseManager = DatabaseManager.databaseManager
    
    func authorization() {
        if databaseManager.authorization(login: loginTextField, password: passwordTextField) {
            activeUserID = databaseManager.getUserID(login: loginTextField, password: passwordTextField).description
        }
    }
    
    func registration() {
        databaseManager.registration(login: loginTextField, password: passwordTextField)
        cleanTextFields()
    }
    
    private func cleanTextFields() {
        loginTextField = ""
        passwordTextField = ""
    }
}
