//
//  DetailsDuCompte.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//


import SwiftUI

struct DetailsDuCompte: View {
  
 
        @State private var isShowingPhotoPicker = false
        @State private var avatarImage = UIImage(named: "lama")!
        @State private var name = ""
        @State private var familyName = ""
        @State private var num = ""
        @State private var mail = ""
        @State private var infos = ""
        var body: some View {
            
                        NavigationView{
            ZStack { // début de la Zstack
                Rectangle()
                    .foregroundColor(Color(.white))
                //            .edgesIgnoringSafeArea(.top)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack{
                        VStack {
                            Text("Profil")
                                .bold()
                                
                                .foregroundColor(Color(.black))
                            //                            .padding(.top)
                            VStack {
                                Image(uiImage:avatarImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        isShowingPhotoPicker = true
                                    }
                            }
                            
                            .sheet(isPresented: $isShowingPhotoPicker, content: { ImagePicker(avatarImage: $avatarImage)})
                        }
                        
                        VStack(alignment: .leading) {
                            
                            
                            Text("Informations Personnelles:")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            //                            .padding()
                            
                            VStack(alignment: .leading) {
                                TextField("Nom", text: $name)
                                    .padding(.leading)
                                    .frame(width: 270, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(color: Color(.black).opacity(0.9), radius: 4, x: 3, y: 3)
                                    .padding(.vertical)
                                
                                TextField("prénom", text: $familyName)
                                    .padding(.leading)
                                    .frame(width: 270, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(color: Color(.black).opacity(0.9), radius: 4, x: 3, y: 3)
                                    .padding(.vertical)
                                
                                
                                TextField("Numero de téléphone", text: $num)
                                    .padding(.leading)
                                    .frame(width: 270, height: 50)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(color: Color(.black).opacity(0.9), radius: 4, x: 3, y: 3)
                                    .padding(.vertical)
                            }
                            
                            Text("Adresse Mail")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                            TextField("adresse mail", text: $mail)
                                .padding(.leading)
                                .frame(width: 270, height: 50)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: Color(.black).opacity(0.9), radius: 4, x: 3, y: 3)
                                .padding(.vertical)
                            
                           
                         
                        }
                       
                            }
                            .padding(.horizontal)
                            .padding()
                        Button("Sauvegarder") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }

                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color(.blue))
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                    }
                    
    //                Spacer()
                }
            }
                        }
        }
   

struct DetailsDuCompte_Previews: PreviewProvider {
    static var previews: some View {
        DetailsDuCompte()
    }
}
