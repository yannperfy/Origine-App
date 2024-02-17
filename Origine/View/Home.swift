//
//  Home.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//
import SwiftUI

struct Home: View {
    let countries = countryList
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    NavigationLink(destination: Person()) {
                        HStack {
                            Image("world map")
                                .resizable() // Rend l'image redimensionnable
                                .frame(width: 40, height: 30) // Définit la taille de l'image
                            Text(country)
                        }
                        .padding()
                    }
                }
                .navigationTitle("Origine")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
