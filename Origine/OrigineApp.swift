//
//  OrigineApp.swift
//  Origine
//
//  Created by Yann Perfy on 31/10/2023.
//

import SwiftUI
import Firebase

@available(iOS 17.0, *)
@main
struct OrigineApp: App {
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
