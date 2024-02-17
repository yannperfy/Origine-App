//
//  Search.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.

import SwiftUI
import MapKit

enum Gender {
    case male, female
}

@available(iOS 17.0, *)
struct Search: View {
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var userLocation: CLLocationCoordinate2D?
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var userGender: Gender = .male // Par défaut, afficher une image d'homme
    var body: some View {
          
        Map(position: $position) {
           
                    if let location = userLocation {
                        Annotation("compatriote", coordinate: location) {
                            ZStack {
                                                   RadialGradient(gradient: radialGradient,
                                                                  center: .center,
                                                                                                                         startRadius: 0.5,
                                                                  endRadius: 40)
                                                       .frame(width: 70, height: 70)
                                                       .clipShape(Circle())
                                                   
                                                   Image(systemName: userGender == .female ? "person.fill" : "person.fill")
                                                       .resizable()
                                                       .scaledToFit()
                                                       .foregroundColor(.white)
                                                       .frame(width: 50, height: 50) // Ajustez la taille de l'image
                                                       .clipShape(Circle())
                                                       .overlay(Circle().stroke(Color.white, lineWidth: 1)) // Ajout d'une bordure si nécessaire
                                               }
                        }
                    }
                }
        
        .mapStyle (.imagery (elevation: .realistic))
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .sheet(isPresented: .constant(true)) {
                   ScrollView {
                       
                   }
                   .padding()
                   .safeAreaPadding(.top )
                   .presentationDetents([.height(54), .height(176)])
                   .presentationBackground(.ultraThinMaterial)
               }
        .onMapCameraChange {
            context in
                visibleRegion = context.region
        }
        
        
        .onAppear {
                   // Demander l'autorisation d'utiliser la localisation
                   CLLocationManager().requestWhenInUseAuthorization()
                   
                   // Mettre à jour les coordonnées de l'utilisateur lorsque la localisation est disponible
            if let location = CLLocationManager().location?.coordinate {
                userLocation = location
                
                // Supposons que vous ayez une logique pour déterminer le genre de l'utilisateur
                              userGender = determineUserGender() // Fonction à remplacer par votre logique réelle
                position = .userLocation(fallback: .automatic)
            }
               }
    
        .navigationTitle("Trouver des compatriotes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
        
    }
    
 
    
    // Exemple de fonction factice pour déterminer le genre de l'utilisateur
    private func determineUserGender() -> Gender {
        // Remplacez cette logique factice par celle correspondant à votre application
        // Par exemple, interrogez vos données utilisateur ou utilisez d'autres mécanismes pour déterminer le genre.
        return .female // Par défaut, considérons que l'utilisateur est une femme
    }
    
    // Créer un dégradé radial pour les rayons de soleil
      var radialGradient: Gradient {
          Gradient(colors: [.orange, .clear,  .red, .yellow, .orange,  .green, .blue, .purple, .clear , .orange])
      }
        
}

@available(iOS 17.0, *)
struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
