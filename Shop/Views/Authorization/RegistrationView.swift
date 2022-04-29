//
//  RegistrationView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        VStack {
            TextField("New Login", text: $viewModel.loginTextField)
                .styleTextField()
            TextField("New Password", text: $viewModel.passwordTextField)
                .styleTextField()
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.registration()
                }, label: {
                    Text("Зарегистрироваться")
                })
                .styleButton(color: .blue)
                Spacer()
            }
        }
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
