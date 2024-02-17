//
//  LoginView.swift
//  Origine
//
//  Created by Yann Perfy on 04/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = " "
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("AppIcon3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .padding(.vertical, 32)
                // form
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Adress",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    InputView(text: $password, title: "Password", placeholder: "Enter your Password",
                    isSecureField: true)
                }


                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                Button {
                    
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                   
                } label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                // sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        Text("Sign up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}
// Mark - authentificationformprotocol
extension LoginView: AuthenticationformProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
