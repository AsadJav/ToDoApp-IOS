//
//  ToDoListItemViewViewModel.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel: ObservableObject{
    
    init(){
    }
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(uid).collection("ToDo's").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
    
    
}
