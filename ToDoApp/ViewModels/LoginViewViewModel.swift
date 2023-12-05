//
//  LoginViewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    var router = NavigationRouter()
    
    init(){
        
    }

    func login(){
        guard validate() else{
            //errorMessage = "Please fill valid email or password"
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    if let error = error {
                        self!.errorMessage = "Sign-in Error: Invalid email or password"
                        return
                    }
                    self?.router.navigate(to: .home)
                }
    }
    
    func validate() -> Bool{
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please fill valid email"
            return false
        }
        return true
    }
    
    func navigateToRegisterScreen(){
        router.navigate(to: .register)
    }
}
