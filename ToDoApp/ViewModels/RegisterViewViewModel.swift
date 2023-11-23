//
//  RegisterViewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    var router = NavigationRouter()
    
    init(){
        
    }
    func Register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
            self!.router.navigate(to: .home)
        }
    }
    
    func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(id).setData(newUser.asDictionary())
    }
    
    func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all the fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter the valid email"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "Please enter a 6 digit password"
            return false
        }
        return true
    }
    
    func navigateToLogin(){
        router.navigate(to: .back)
    }
    
}



