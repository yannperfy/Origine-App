//
//  PageSlidingView.swift
//  Origine
//
//  Created by Yann Perfy on 16/02/2024.


import SwiftUI

struct PageSlidingView: View {
    
    var page = Page(name: "", description: "", imageUrl: "")
    var body: some View {
        VStack(spacing: 20) {
            Image ("\(page.imageUrl)")
            
                .resizable ()
                .scaledToFit ()
                .padding ()
                .cornerRadius (30)
                .background (.gray.opacity(0.10))
                .cornerRadius (10)
                .padding ()
            Text(page.name)
                .font (.title)
            
            Text (page.description)
                .font (.subheadline)
                .frame(width: 300)
        }
    }
}

struct PageSlidingView_Previews: PreviewProvider {
    static var previews: some View {
        PageSlidingView(page: Page.samplePage)
    }
}
 
