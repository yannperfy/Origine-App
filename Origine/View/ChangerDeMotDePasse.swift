//
//  ChangerDeMotDePasse.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//
import SwiftUI
struct ChangerDeMotDePasse: View {
    @State private var actuelPassword = ""
    @State private var newPassword = ""
    @State private var confirmePassword = ""
    @State private var showingLoginScreen = false
    @State private var wrongActuelPassword = false
    @State private var wrongNewPassword = false
    @State private var wrongConfirmePassword = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Modifier")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    SecureField("Mot de passe actuel", text: $actuelPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                        .border(.red, width: wrongActuelPassword ? 1 : 0)
                    SecureField("Nouveau mot de passe", text: $newPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                        .border(.red, width: wrongNewPassword ? 1 : 0)
                    SecureField("Confirmer le mot de passe", text: $confirmePassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        
                        .cornerRadius(20)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                        .border(.red, width: wrongConfirmePassword ? 1 : 0)
                    
                    
                    Button("Enregistrer les modifications") {
                        authenticateUser()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color(.blue))
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                }
            }
        }
        .navigationBarTitle(Text("Changer Mot De Passe"))
       
    }
    
    func authenticateUser() {
        if actuelPassword == "Yves2004" {
            wrongActuelPassword = false
            
            if newPassword.count >= 6 && newPassword == confirmePassword {
                showingLoginScreen = true
                wrongNewPassword = false
                wrongConfirmePassword = false
            } else {
                if newPassword.count < 6 {
                    wrongNewPassword = true
                } else {
                    wrongNewPassword = false
                }
                if newPassword != confirmePassword {
                    wrongConfirmePassword = true
                } else {
                    wrongConfirmePassword = false
                }
            }
        } else {
            wrongActuelPassword = true
        }
    }
}


struct ChangerDeMotDePasse_Previews: PreviewProvider {
    static var previews: some View {
        ChangerDeMotDePasse()
    }
}
