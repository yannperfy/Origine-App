//
//  UserLogin.swift
//  Origine
//
//  Created by Yann Perfy on 05/02/2024.
//

import Foundation


struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    
}


extension User {
    static var MOCK_USERLOGIN = User(id: NSUUID().uuidString, fullname: "brad", email: "brad@gmail.com")
}
