//
//  AuthorizationView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AuthorizationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()
    let color = Color("Color-1")
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("Login", text: $viewModel.loginTextField)
                    .graffitiTextFieldStyle()
                TextField("Password", text: $viewModel.passwordTextField)
                    .graffitiTextFieldStyle()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.authorization()
                    }, label: {
                        Text("Вход")
                            .fontWeight(.bold)
                            .foregroundColor(color)
                            .graffitiButtonStyle(color: color)
                    })
                    Spacer()
                    NavigationLink(destination: RegistrationView()) {
                        Text("Регистрация")
                            .fontWeight(.bold)
                            .foregroundColor(color)
                            .graffitiButtonStyle(color: color)
                    }
                    Spacer()
                }
            }
            .navigationTitle("Authorization")
            .background(Color("Color").ignoresSafeArea())
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
