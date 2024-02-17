//
//  Message.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//

import SwiftUI

struct Message: View {
    var body: some View {
        
        NavigationView {
            VStack {
            VStack {
                NavigationLink (destination: Home()){
                    
                    
                    
                    Text("VOUS N'AVEZ AUCUN MESSAGE").frame(width: 300, height: 60, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Color Dark green"))
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                }
                Text("COMMENCER UNE DISCUSSION")
                Image(systemName: "plus.message.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .imageScale(.small)
                
            }
        }
            
           
            
       
            
        }
        .navigationBarTitle(Text("Messages"))
    }
    
        
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message()
    }
}
