//
//  LoginScreen.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//

//
//  LoginScreen.swift
//  MarketStorne
//
//  Created by Yann Perfy on 08/08/2023.
//

import SwiftUI

struct LoginScreen: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            NavigationLink (destination: Home()) {
                                Image(systemName: "plus")
        //                            .bold()
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background (Color.yellow)
                                    .cornerRadius(50)
                                    .shadow(color: Color.yellow.opacity(0.3), radius: 7, x: 4, y: 4)
                            }
                        }
                    }
                
                
             
               
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("UserName", text: $userName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUserName))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        // authenticate the user
                        authentifcateUser(userName: userName, password: password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color(.orange))
                    .cornerRadius(10)
                    
                    
                    NavigationLink(destination: Text("You are logged in @\(userName)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func authentifcateUser(userName: String, password: String) {
        if userName.lowercased() == "Yves24" {
            wrongPassword = 0
            if password.lowercased() == "abc500" {
                wrongPassword = 0
                showingLoginScreen = true
                
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUserName = 2
            
        }
            
    }
}




struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
