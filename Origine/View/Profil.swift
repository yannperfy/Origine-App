//
//  Profil.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//

 

import SwiftUI

struct Profil: View {
    let profilInfos = compteList
    @State var isFirstAlertPresented = false
    @State var isSecondAlertPresented = false
    @State private var showCardCreation = false // Nouvelle variable d'état pour afficher la vue CardCreation
    @State private var showCommandes = false
    @State private var showDetailsDuCompte = false
    @State private var showChangerDeMotDePasse = false
    @State private var showProfilView = false
   
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // List of comptes
                List {
                               ForEach(profilInfos) { infos in
                                   // Utilisez le texte "Méthodes de paiement" pour afficher la vue CardCreation
                                 if  infos.nameCompte == "détails du compte" {
                                       // Lorsque "Méthodes de commandes" est cliqué, affichez la vue Commandes
                                       NavigationLink(
                                           destination: DetailsDuCompte(),
                                           isActive: $showDetailsDuCompte,
                                           label: {
                                               Text(infos.nameCompte)
                                           }
                                       )
                                   }
                                   else if  infos.nameCompte == "Changer de mot de passe" {
                                       // Lorsque "Méthodes de commandes" est cliqué, affichez la vue Commandes
                                       NavigationLink(
                                           destination: ChangerDeMotDePasse(),
                                           isActive: $showChangerDeMotDePasse,
                                           label: {
                                               Text(infos.nameCompte)
                                           }
                                       )
                                   }
                                   else if  infos.nameCompte == "Paramètres de l'application" {
                                       // Lorsque "Méthodes de commandes" est cliqué, affichez la vue Commandes
                                       NavigationLink(
                                           destination: ProfilView(),
                                           isActive: $showProfilView,
                                           label: {
                                               Text(infos.nameCompte)
                                           }
                                       )
                                   }
                                   else {
                                       // Pour les autres éléments, affichez les détails du compte
                                       NavigationLink(
                                           destination: CompteDetail(compte: infos),
                                           label: {
                                               Text(infos.nameCompte)
                                           }
                                       )
                                   }
                               }
                           }
                
                // Spacer to add flexible space between list and button
                Spacer()
                
                // Button "Déconnecter"
                Button {
                    isFirstAlertPresented = true // Mettre isFirstAlertPresented à true pour afficher l'alerte
                } label: {
                    Text("Déconnecter")
                        .frame(width: 300, height: 60)
                        .background(Color("Color Dark green"))
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .cornerRadius(10)
                        .shadow(color: .colorRoyalPurple, radius: 10, x: 10, y: 10)
                }

                
                
                .padding(.vertical) // Add vertical padding between button and list
                
                // Spacer to add flexible space between button and Tab bar
                Spacer()
                    .padding(.bottom, -5) // Move the button up by 10 points
                
            }
            .navigationTitle("Comptes")
            
        }
        .alert("Veux tu te déconnecter ?", isPresented: $isFirstAlertPresented) {
            Button("Oui", role: .destructive){
                isSecondAlertPresented = isTrue(true: true)!
            }
            Button("Non pas Maintenant ...", role: .cancel) {
                
            }
        }
        .alert("êtes vous sure ?", isPresented: $isSecondAlertPresented ) {
            Button("Ouiii", role: .destructive){
                closeApp()
                
            }
            Button("Bah, top ...", role: .cancel) {
                
            }
        }
    }
    func closeApp() {
        exit(0)
    }
    
    func isTrue(true: Bool) -> Bool? {
        if true == true {
            return true
            
        } else if true == false {
            return false
        } else {
            return nil
        }
    }
}

struct CompteDetail: View {
    let compte: ListCompte
    
    var body: some View {
        VStack {
            Text(compte.nameCompte)
            // You can display more details of the compte here
        }
        .navigationTitle(compte.nameCompte)
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
