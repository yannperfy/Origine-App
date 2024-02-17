//
//  UserRow.swift
//  Origine
//
//  Created by Yann Perfy on 29/01/2024.
//

import SwiftUI

struct UserRow: View {
    var body: some View {
        VStack(spacing: 15){
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                Button {
                    
                } label: {
                    Image("1")
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(15)
                        .shadow(color: .colorRoyalPurple, radius: 15, x: 15, y: 15)
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color("ColorDarkgreen"))
                            .padding(.all, 10)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                   
                    Button {
                        
                    } label: {
                        Image(systemName: "message.fill")
                            .foregroundColor(Color("Color Royal purple"))
                            .padding(.all, 10)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.all, 10)
                }
            
            }
            
            Text("yann perfy")
                .foregroundColor(Color("Color Dark green"))
                .fontWeight(.bold)
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow()
    }
}
