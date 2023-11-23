//
//  User.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import Foundation


struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
