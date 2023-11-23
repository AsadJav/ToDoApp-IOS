//
//  ToDoListViewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func deleteItem(id: String){
        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("ToDo's").document(id).delete()
    }
}
