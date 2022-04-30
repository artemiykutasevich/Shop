//
//  RegistrationView.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()
    let color = Color("Color-1")
    
    var body: some View {
        ScrollView {
            TextField("New Login", text: $viewModel.loginTextField)
                .graffitiTextFieldStyle()
            TextField("New Password", text: $viewModel.passwordTextField)
                .graffitiTextFieldStyle()
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.registration()
                }, label: {
                    Text("Зарегистрироваться")
                        .fontWeight(.bold)
                        .foregroundColor(color)
                        .graffitiButtonStyle(color: color)
                })
                Spacer()
            }
        }
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("Color").ignoresSafeArea())
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
