//
//  RegistrationView.swift
//  Origine
//
//  Created by Yann Perfy on 05/02/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var avatarImage = UIImage(named: "lama")!
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var conrfirmePassword = ""
    @State var shouldShowImagePicker = false
    @Environment(\.dismiss) var dismiss
   @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                VStack {
                   
                        Image(uiImage:avatarImage)

                            .resizable()
                            .scaledToFill()
                            .foregroundColor(Color(.label))
                            .frame(width: 150, height: 150)
                            
                            .clipShape(Circle())
                            .onTapGesture {
                                shouldShowImagePicker = true
                            }
                    
                }
                
            }
            
                .padding(.vertical, 32)
            
            // form
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Adress",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullname,
                          title: "fullname",
                          placeholder: "enter your name")
                .autocapitalization(.none)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your Password",
                          isSecureField: true)
                ZStack(alignment: .trailing) {
                    InputView(text: $conrfirmePassword,
                              title: "confirmePassword",
                              placeholder: "confirme your Password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !conrfirmePassword.isEmpty {
                        if password == conrfirmePassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
            }
            
            
            .padding(.horizontal)
            .padding(.top, 12)
        
            
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password , fullname:fullname, avatarImage: avatarImage)
                }
            } label: {
                HStack {
                    Text("Sign Up")
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
            
            Button{
                dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Already have an account")
                            Text("Sign In")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .font(.system(size: 14))
                    }
           
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(avatarImage: $avatarImage)
        }
    }
        
}



// Mark - authentificationformprotocol
extension RegistrationView: AuthenticationformProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        
        
         && conrfirmePassword == password
        && fullname.isEmpty
    }
}



#Preview {
    RegistrationView()
}
