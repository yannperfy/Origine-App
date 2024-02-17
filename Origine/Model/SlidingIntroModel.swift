//
//  SlidingIntroModel.swift
//  Origine
//
//  Created by Yann Perfy on 15/02/2024.
//

import Foundation

struct Page: Identifiable , Equatable {
   let id = UUID ()
   var name: String
   var description: String
   var imageUrl: String

    
    
  static var samplePage = Page (name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "OrigineApp1")
    
  static var samplePages: [Page] = [
Page (name: "Bienvenue sur l'application Oriigine!", description: "La meilleure Application pour rencontrer les personne de la même origine que soi autour de soi", imageUrl: "OrigineApp2"),
Page (name: "rencontre des nouvelles personnes autour de toi !", description: "The best app to get stuff done in an app", imageUrl: "OrigineApp3"),
Page (name: "Organise une rencontre si tu te sens depaysé dans ta nouvelle localité!", description: "The best app to get stuff done in an app", imageUrl: "OrigineApp4"),
Page (name: "Active ta localisation et dialogue avec une personne de ton origine!", description: "The best app to get stuff done in an app", imageUrl: "OrigineApp3")]

     }
