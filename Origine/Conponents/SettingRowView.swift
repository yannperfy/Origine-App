//
//  SettingRowView.swift
//  Origine
//
//  Created by Yann Perfy on 05/02/2024.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tinColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tinColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "Version", tinColor: Color(.systemGray))
}
