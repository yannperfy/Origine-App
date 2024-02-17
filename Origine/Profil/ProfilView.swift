//
//  ProfilView.swift
//  Origine
//
//  Created by Yann Perfy on 05/02/2024.
//

import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.white))
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
                
                Section("General") {
                    
                    HStack {
                        SettingRowView(imageName: "gear",
                                       title: "Version",
                                       tinColor: Color(.systemGray))
                        
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "sign out",
                            tinColor: .red)
                    }
                    
                    
                    Button {
                        print("Delete Account...")
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account",
                            tinColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilView()
}
