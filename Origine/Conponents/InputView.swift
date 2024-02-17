//
//  InputView.swift
//  Origine
//
//  Created by Yann Perfy on 04/02/2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
            
        }
    }
}

struct InputView_previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Adress", placeholder: "name@Exeample.com")
    }
}
