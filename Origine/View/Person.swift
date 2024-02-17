//
//  Person.swift
//  Origine
//
//  Created by Yann Perfy on 29/01/2024.
//

import SwiftUI

struct Person: View {
    
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("Origin UserLogin")
                    .foregroundColor(.gray)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "rectangle.grid.1x2")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .padding(.top,25)
            
            LazyVGrid(columns: self.columns, spacing: 20) {
                ForEach(0..<50) { user in
                   UserRow()
                    
                }
            }
            .padding([.horizontal, .top])
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}

struct Person_Previews: PreviewProvider {
    static var previews: some View {
        Person()
    }
}
