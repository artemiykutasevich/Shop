//
//  AuthorizationView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct AuthorizationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Login", text: $viewModel.loginTextField)
                    .styleTextField()
                TextField("Password", text: $viewModel.passwordTextField)
                    .styleTextField()
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.authorization()
                    }, label: {
                        Text("Вход")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                            .styleButton(color: Color("Color"))
                    })
                    Spacer()
                    NavigationLink(destination: RegistrationView()) {
                        Text("Регистрация")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color-1"))
                            .styleButton(color: Color("Color-1"))
                    }
                    Spacer()
                }
            }
            .navigationTitle("Authorization")
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
