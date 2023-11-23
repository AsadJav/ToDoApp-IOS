//
//  ProfileViewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel: ObservableObject{
    
    @Published var user: User? = nil
    
    init(){
    }
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("Users").document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.user = User(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as! TimeInterval ?? 0)
            }
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
}
