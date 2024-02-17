//
//  ListCompte.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//

import Foundation
struct ListCompte : Identifiable , Hashable {
    var id: UUID = UUID()
    var nameCompte: String
    var imageCompte: String
}
let compteList: [ListCompte] = [
    ListCompte(nameCompte: "détails du compte", imageCompte: ""),
   ListCompte(nameCompte:  "Adresse", imageCompte: ""),
    ListCompte(nameCompte: "Changer de mot de passe", imageCompte: ""),
    ListCompte(nameCompte: "Préference de contact", imageCompte: ""),
    ListCompte(nameCompte: "Paramètres de l'application", imageCompte: ""),
   ListCompte(nameCompte:   "Aides et assistance", imageCompte: "")
    
]
