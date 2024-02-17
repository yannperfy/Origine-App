//
//  User.swift
//  Origine
//
//  Created by Yann Perfy on 29/01/2024.
//

import Foundation

struct UserLogin: Decodable, Identifiable {
    let id: Int
    let name: String
    let avatarUrl: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
}


