//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by AALA mac on 14/11/2023.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
