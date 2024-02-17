//
//  AuthViewModel.swift
//  Origine
//
//  Created by Yann Perfy on 05/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseStorage

enum YourError: Error {
    case userNotLoggedIn
    case imageConversionError
    // Ajoutez d'autres cas d'erreur au besoin
}


protocol AuthenticationformProtocol {
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with user with error \(error.localizedDescription)")
        }
        
    }
    func createUser(withEmail email: String, password: String, fullname: String, avatarImage: UIImage) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()

            // Appel à persistImage pour sauvegarder l'image du profil
            try await persistImage(avatarImage) { result in
                switch result {
                case .success(let downloadURL):
                    print("Image persisted successfully. Download URL: \(downloadURL)")
                    // Ici, vous pourriez mettre à jour votre modèle d'utilisateur avec downloadURL
                case .failure(let error):
                    print("Failed to persist image with error \(error.localizedDescription)")
                }
            }

        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")

        }
    }

    
    func signOut() {
        do {
            try Auth.auth().signOut() // Sign out usernon backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to Sign out with error\(error.localizedDescription)")
        }
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot =  try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
       
    }
    
    func persistImage(_ image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let userId = userSession?.uid else {
            // Gérer l'absence d'utilisateur connecté
            completion(.failure(YourError.userNotLoggedIn))
            return
        }

        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            // Gérer l'erreur de conversion de l'image en données JPEG
            completion(.failure(YourError.imageConversionError))
            return
        }

        let storageRef = Storage.storage().reference().child("profile_images").child("\(userId).jpg")

        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            storageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let downloadURL = url {
                    // La sauvegarde de l'URL de téléchargement dans la base de données Firestore
                    let db = Firestore.firestore()
                    let userRef = db.collection("users").document(userId)

                    userRef.updateData(["profileImageUrl": downloadURL.absoluteString]) { error in
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            // Mise à jour de l'interface utilisateur avec l'URL persistante
                            completion(.success(downloadURL))
                        }
                    }
                }
            }
        }
    }

}
