//
//  MainVIewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject{
    @Published var currentUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener({ _, user in
            DispatchQueue.main.async {
                self.currentUserId = user?.uid ?? ""
            }
        })
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
