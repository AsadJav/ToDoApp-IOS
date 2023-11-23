//
//  ContentView.swift
//  ToDoApp
//
//  Created by AALA mac on 14/11/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn,
           !viewModel.currentUserId.isEmpty {
                accountView
                
        }
        else{
                LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
            TabView {
                NavigationView {
                    ToDoListView(userId: viewModel.currentUserId)
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                NavigationView {
                    ProfileView()
                }
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
